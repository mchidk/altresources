puts "generating regions"

top_nav_region        = RegionType.create!(:name => 'Top Nav',        :domid => "top-nav")
main_nav_region       = RegionType.create!(:name => 'Main Nav',       :domid => "main-nav")
bottom_footer_region  = RegionType.create!(:name => 'Bottom Footer',  :domid => "bottom-footer")
footer_region         = RegionType.create!(:name => 'Footer',         :domid => "footer",         :role => 'administrator')
nav_regions           = [top_nav_region, main_nav_region, footer_region, bottom_footer_region]

#admin_nav_region     = RegionType.create!(:name => 'Admin Nav',      :domid => "admin-nav")
banner_region         = RegionType.create!(:name => 'Main Banner',    :domid => "main-banner",    :role => 'administrator',  :identifier => "banner_main")

column_regions        = []
column_regions        << right_col_region  = RegionType.create!(:name => 'Right Column',   :domid => "right",          :role => 'administrator')
#column_regions       << middle_col_region = RegionType.create!(:name => 'Middle Column',  :domid => "middle",         :role => 'administrator')
#column_regions       << left_col_region   = RegionType.create!(:name => 'Left Column',    :domid => "left",           :role => 'administrator')

content_regions       = []
content_regions       << top_region = RegionType.create!(:name => 'Content Top',    :domid => "content-top",    :role => 'administrator')
content_regions       << bottom_region = RegionType.create!(:name => 'Content Bottom', :domid => "content-bottom", :role => 'administrator')

one_column_regions = [nav_regions, content_regions, banner_region].flatten

page_layout_regions  = 
blog_layout_regions  = 
slide_layout_regions =
forum_layout_regions = [nav_regions, content_regions, banner_region, column_regions].flatten

# admin nav is only nav and admin nav
admin_layout_regions = [nav_regions].flatten

########################################################################################################################################

puts "generating layouts"

page_layout = Layout.create!(
  :name => "Page: Two Column",
  :template => "application/default/page",
  :identifier => "user_page",
  :region_types => page_layout_regions,
  :system => true
).init!

home_layout = page_layout.prototype!(
  :name => "Page: Home",
  :template => "application/home",
  :identifier => "user_page_home",
  :system => true
).init!

two_col_layout = page_layout

one_col_layout = page_layout.prototype!(
  :name => "Page: One Column",
  :template => "application/one_column",
  :identifier => "user_page_one_column",
  :region_types => one_column_regions,
  :system => true
)

admin_layout = page_layout.prototype!(
  :name => "Admin",
  :template => "application/admin",
  :identifier => "user_page_admin",
  :region_types => admin_layout_regions,
  :role => "e9_user",
  :system => true
).reset!

Layout.create!(
  :name => "Blog",
  :template => "application/default/blog",
  :identifier => "blog", 
  :region_types => blog_layout_regions,
  :system => true
).init!

Layout.create!(
  :name => "Forum",
  :template => "application/default/forum",
  :identifier => "forum", 
  :region_types => forum_layout_regions,
  :system => true
).init!

Layout.create!(
  :name => "Slide Default",
  :identifier => "slide",
  :template => "application/default/slides/one",
  :image_spec => ImageSpec.create!(:name => "Slide One", :width => 505, :height => 335, :system => true),
  :region_types => slide_layout_regions,
  :system => true
).init!

puts "Generating Widget Templates"
default_feed_template = WidgetTemplate.create!(:name => "Default Feed", :body => <<-TEMPLATE)
<div class="default-feed-module">
  <div class="left image">
    <a href="{{record.path}}">
      <img src="{{record.thumb_url}}"/>
    </a>
  </div>
  <h3>
    <a href="{{record.path}}">{{record.title}}</a>
  </h3>
  <div class="info">
    <p>{{record.published_at}}</p>
    <p>by {{record.author.name}}</p>
  </div>
  <p>{{record.description | truncate:200 }}</p>
</div>
TEMPLATE

title_and_description_template = WidgetTemplate.create!(:name => "Titles and Descriptions", :body => <<-TEMPLATE)
<dl class="title-description-module">
  <dt>
    <a href="{{ record.url }}">{{ record.title }}</a>
  </dt>
  <dd>{{ record.description |) truncate:'70','...' }} </dd>
</dl>
TEMPLATE

author_template = WidgetTemplate.create!(:name => "Titles and Authors", :body => <<-TEMPLATE)
<div class="title-author-module">
  <div class="left image">
    <a href="{{record.path}}">
      <img src="{{record.thumb_url}}"/>
    </a>
  </div>
  <div>
    <a href="{{record.path}}">{{record.title}}</a>
    <h3>{{record.author.name}}</h3>
    <p>{{record.description | truncate:50 }}</p>
  </div>
</div>
TEMPLATE

page_layout  = Layout.for(UserPage)
slide_layout = Layout.for(Slide)
forum_layout = Layout.for(Forum)
blog_layout  = Layout.for(Blog)
admin_layout = Layout.find_by_identifier('user_page_admin')
layouts      = Layout.all

puts "Generating Main Menu"
main_menu_snippet = Snippet.create!(:name => "Main Menu", :template => "<ul class=\"menu\">{% menu identifier[main_menu] %}</ul>", :region_types => [main_nav_region])
(layouts - [admin_layout]).each {|layout| layout.region('main-nav').add_renderable!(main_menu_snippet) }

puts "Generating Top Nav Menu"
top_nav_content = Snippet.create!(:name => "Top Nav Content", :template => <<-TEMPLATE, :region_types => [top_nav_region])
<ul class="right">
  <li class="welcome">
    {% if current_user %}
      {% welcome_firstname %}
    {% else %}
      Welcome!
    {% endif %}
  </li>
  {% menu identifier[top_nav_menu] %}
  <li class="search"> 
    <form method="GET" action="/search" style="display:none">
      <fieldset>
        <input type="text" name="query" id="search_query" >
      </fieldset>
    </form>
    <a href="#">Search</a>
  </li>
</ul>
TEMPLATE
layouts.each {|layout| layout.region('top-nav').add_renderable!(top_nav_content) }

puts "Generating footer feed"
mv = FeedWidget.create!(:name => "Title & Author Feed", :region_types => [footer_region], :widget_template => author_template, :options => {
  :content_type => ['user_page'],
  :limit => 2
})
layouts.map {|layout| layout.region('footer') }.compact.each {|region| region.add_renderable!(mv) }

puts "Generating footer nav + social"
mv = Snippet.create!(:name => "Footer Menu & Social Links", :template => <<-TEMPLATE, :region_types => [footer_region], :set_revert_template => true)
<div class="footer-module">
  <ul class="footer-menu menu">
    {% menu identifier[footer_menu] %}
  </ul>
  <ul class="social-module">
    <li><a class="social-link facebook" href="{{ config.facebook_company_page_url }}" rel="external">Favorite us on Facebook</a></li>
    <li><a class="social-link twitter" href="{{ config.twitter_company_page_url }}" rel="external">Follow us on Twitter</a></li>
    <li><a class="social-link linked-in" href="{{ config.linked_in_company_page_url }}" rel="external">Connect on LinkedIn</a></li>
    <li>
      <a class="social-link hello" href="/contact-us">
        For more BNI Lucky 62 info, call us at: <span class="maroon italic">1.646.233.1068</span>
      </a>
    </li>
  </ul>
</div>
TEMPLATE
layouts.each {|layout| layout.region('footer').add_renderable!(mv) }

mv = Snippet.create!(:name => "Bottom Footer Content", :template => <<-TEMPLATE, :region_types => [bottom_footer_region], :set_revert_template => true, :role => 'e9_user')
<span class="copyright">{% helper footer_copyright_content %}</span>
<span> | </span>
<span class="marketsmiths">
  <a href="http://www.marketsmiths.com" rel="external">Website copy</a> 
  by 
  <a href="http://www.marketsmiths.com" rel="external">MarketSmiths</a>
</span>
<span class="e9digital">
  {% helper link_to_google_bomb %}
</span>
TEMPLATE
layouts.each {|layout| layout.region('bottom-footer').add_renderable!(mv) }

puts "Generating default banner (#{E9::Config[:banner_width]}x#{E9::Config[:banner_height]})"
banner = Banner.create!(:name => "Main Banner", :height => E9::Config[:banner_height], :width => E9::Config[:banner_width], :region_types => [banner_region], :role => 'user')
banner.images << Image.create!(:file => File.open("#{Rails.root}/public/images/site/banner.jpg"))
layouts.map {|layout| layout.region('main-banner') }.compact.each {|region| region.add_renderable!(banner) }

puts "Adding forum menu to forum layout"
forums_menu = Partial.create!(:name => "Forum Menu", :file => "partials/forum_menu", :role => 'e9_user', :region_types => column_regions)
Layout.for(Forum).region("right").add_renderable!(forums_menu)

puts "Adding blog menu to blog layout"
blog_menu = Partial.create!(:name => "Blog Menu", :file => "partials/blog_menu", :role => 'e9_user', :region_types => column_regions)
Layout.for(Blog).region("right").add_renderable!(blog_menu)

puts "Adding next/prev links to blog layout"
prev_next_links = Snippet.create!(:name => "Previous/Next Links", :template => <<-TEMPLATE, :region_types => column_regions, :set_revert_template => true, :formatter => 1)
{% if page.previous_record or page.next_record %}
  <div class="record-seq">
    <div class="record-seq-prev">
    {% if page.previous_record %}   
      <div class="record-seq-link">{% link_to previous_record text[&lt; Previous] %}</div>
      <div class="record-seq-image">{% link_to previous_record thumb[true] %}</div>
      <div class="record-seq-title">{% link_to previous_record %}</div>
      <div class="record-seq-dateline">{{ page.previous_record.created_at }}</div>
      <div class="record-seq-author">by {{ page.previous_record.author.name }}</div>
      <div class="record-seq-summary">{{ page.previous_record.summary | truncate: 50 }}</div>
    {% else %} 
      <div class="record-seq-link"><span class="ico">&lt; Previous</span></div>
      <div class="record-seq-image"><img src="/images/defaults/blog_nav_thumb.png" /></div>
      <div class="record-seq-title">{{ page.parent.title }}</div>
    {% endif %}
    </div>
    <div class="record-seq-next">
    {% if page.next_record %} 
      <div class="record-seq-link">{% link_to next_record text[Next &gt;] %}</div>
      <div class="record-seq-image">{% link_to next_record thumb[true] %}</div>
      <div class="record-seq-title">{% link_to next_record %}</div>
      <div class="record-seq-dateline">{{ page.next_record.created_at }}</div>
      <div class="record-seq-author">by {{ page.next_record.author.name }}</div>
      <div class="record-seq-summary">{{ page.next_record.summary | truncate: 50 }}</div>
    {% else %} 
      <div class="record-seq-link"><span class="ico">Next &gt;</span></div>
      <div class="record-seq-image"><img src="/images/defaults/blog_nav_thumb.png" /></div>
      <div class="record-seq-title">{{ page.parent.title }}</div>
    {% endif %}
    </div>
  </div>
{% endif %}
TEMPLATE
Layout.for(Blog).region("right").add_renderable!(prev_next_links)

puts "Generating sidebar feed"
mv = FeedWidget.create!(:name => "Blog Feed", :region_types => column_regions, :widget_template => default_feed_template, :options => {
  :header_text => 'Find more tips in my energy saving blog!',
  :limit => 2
})
layouts.map {|layout| layout.region('right') }.compact.each {|region| region.add_renderable!(mv) }

puts "Generating admin menu snippet"
admin_layout.region("main-nav").add_renderable!(Snippet.create!(:name => "Admin Menu", :template => "<ul class=\"menu\">{% menu identifier[admin_menu] %}</ul>", :role => 'user', :region_types => [ main_nav_region ]))
