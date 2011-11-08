puts "generating regions"

top_nav_region        = RegionType.create!(:name => 'Top Nav',        :domid => "top-nav")
main_nav_region       = RegionType.create!(:name => 'Main Nav',       :domid => "main-nav")
bottom_footer_region  = RegionType.create!(:name => 'Bottom Footer',  :domid => "bottom-footer")
footer_region         = RegionType.create!(:name => 'Footer',         :domid => "footer",         :role => 'administrator')
nav_regions           = [top_nav_region, main_nav_region, footer_region, bottom_footer_region]

column_regions = []
column_regions << right_col_region  = RegionType.create!(:name => 'Right Column',   :domid => "right",          :role => 'administrator')

content_regions = []
content_regions << top_region = RegionType.create!(:name => 'Content Top', :domid => "content-top", :role => 'e9_user')
content_regions << bottom_region = RegionType.create!(:name => 'Content Bottom', :domid => "content-bottom", :role => 'administrator')

slide_layout_regions =
one_column_regions   = [nav_regions, content_regions].flatten

page_layout_regions  = 
blog_layout_regions  = 
forum_layout_regions = [nav_regions, content_regions, column_regions].flatten

# admin nav is only nav and admin nav
admin_layout_regions = [nav_regions - [footer_region]].flatten

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
  :region_types => one_column_regions,
  :system => true
).init!

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
  :name => "Slide Page",
  :identifier => "user_page_slide",
  :template => "application/default/slide",
  :region_types => slide_layout_regions,
  :system => true
).init!

Layout.create!(
  :name => "Slide One",
  :identifier => "slide",
  :template => "application/default/slides/one",
  :image_spec => ImageSpec.create!(:name => "Slide One", :width => 310, :height => 465, :system => true),
  :region_types => slide_layout_regions,
  :system => true
).init!

##############################################################################

puts "Generating Widget Templates"
default_feed_template = WidgetTemplate.create!(:name => "Full Data and Thumbs", :body => <<-TEMPLATE)
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

titles_template = WidgetTemplate.create!(:name => "Titles Only", :body => <<-TEMPLATE)
<span>
  <a href="{{ record.url }}">{{ record.title }}</a>
</span>
TEMPLATE

##############################################################################

layouts              = Layout.all
admin_layout         = Layout.find_by_identifier('user_page_admin')
layouts_except_admin = layouts - [admin_layout]

puts "Generating admin menu snippet"
admin_layout.region("main-nav").add_renderable!( Snippet.create!( :name => "Admin Menu", :template => "<ul class=\"menu\">{% menu identifier[admin_menu] %}</ul>", :role => 'user', :region_types => [ main_nav_region ]))

puts "Generating Main Menu"
main_menu_snippet = Snippet.create!(:name => "Main Menu", :template => "<ul class=\"menu\">{% menu identifier[main_menu] %}</ul>", :region_types => [main_nav_region])
layouts_except_admin.each {|layout| layout.region('main-nav').add_renderable!(main_menu_snippet) }

def add_renderable(renderable, domid, layouts)
  layouts.map {|l| l.region(domid) }.compact.each {|r| r.add_renderable!(renderable) }
end

puts "Generating Top Nav Menu"
mv = Snippet.create!(:name => "Top Nav Content", :template => <<-TEMPLATE, :region_types => [top_nav_region])
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
add_renderable(mv, 'top-nav', layouts)

puts "Generating Footer Menu"
mv = Snippet.create!(:name => "Footer Menu", :template => <<-TEMPLATE, :region_types => [footer_region], :set_revert_template => true)
<div class="footer-module">
  <dl>
    <dt><h4>Navigate our site</h4></dt>
    <dd>
      <ul class="footer-menu menu">
        {% menu identifier[footer_menu] %}
      </ul>
    </dd>
  </dl>
</div>
TEMPLATE
add_renderable(mv, 'footer', layouts)

puts "Generating Footer Feed 1"
mv = FeedWidget.create!(:name => "Single Blog Feed", :region_types => [footer_region, column_regions].flatten, :widget_template => default_feed_template, :options => {
  :header_text => 'Latest News and Events',
  :limit => 1
})
add_renderable(mv, 'footer', layouts)

puts "Generating Contact Us Today!"
mv = Snippet.create!(:name => "Contacts Us", :template => <<-TEMPLATE, :region_types => [footer_region], :set_revert_template => true)
<div class="footer-module">
  <dl class="contact-info">
    <dt><h4>Contact Us</h4></dt>
    <dd>
      <p class="company">AltResources LLC</p>
      <p class="numbers"><span>Main: 1.646.820.2660<br/>
      Fax: 1.646.820.2630</span></p>

      <p class="name"><span>John Wiencek<br/>
      (T) 1.646.820.0015</span></p>

      <p class="emails">John.Wiencek@altrllc.com<br/>
      Information: info@altrllc.com<br/>
      Careers: careers@altrllc.com</p>
    </dd>
  </dl>
</div>
TEMPLATE
add_renderable(mv, 'footer', layouts)

puts "Generating Footer Feed 1"
mv = FeedWidget.create!(:name => "Career Blog Feed", :region_types => [footer_region, column_regions].flatten, :widget_template => titles_template, :options => {
  :header_text => 'Career Opportunities',
  :limit => 2
})
add_renderable(mv, 'footer', layouts)

puts "Generating social module"
mv = Snippet.create!(:name => "Footer Social Module", :template => <<-TEMPLATE, :region_types => [footer_region], :set_revert_template => true, :formatter => 1)
<div class="footer-module">
  <h4>Connect With Us!</h4>
  <ul class="social-module">
    <li><a class="social-link facebook" href="{{ config.facebook_company_page_url }}" rel="external">Favorite us on Facebook</a></li>
    <li><a class="social-link twitter" href="{{ config.twitter_company_page_url }}" rel="external">Follow us on Twitter</a></li>
    <li><a class="social-link linked-in" href="{{ config.linked_in_company_page_url }}" rel="external">Connect on LinkedIn</a></li>
  </ul>
</div>
TEMPLATE
add_renderable(mv, 'footer', layouts)

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
add_renderable(mv, 'bottom-footer', layouts)

puts "Generating Home Headlines"
mv = Snippet.create!(:name => "Home Headlines", :template => <<-TEMPLATE, :region_types => [top_region], :set_revert_template => true)
<div class="headline" style="display:none">
   Headline 1. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua sed do eiusmod...
</div>
<div class="headline" style="display:none">
   Headline 2. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua sed do eiusmod...
</div>
<div class="headline">
   Headline 3. Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.
</div>
TEMPLATE
home_layout.region('content-top').add_renderable!(mv)

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
