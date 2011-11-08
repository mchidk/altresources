puts "Building Admin Menu"

admin_menu = Menu.create!(:name => "Admin Menu", :identifier => 'admin_menu', :system => true, :editable => false)

admin_home  = HardLink.create!(:parent => admin_menu, :name => "Admin Home", :href => "/admin/dashboard")
HardLink.create!(:parent => admin_home,  :name => "Analytics",         :href => "http://google.com/analytics", :external => true)
HardLink.create!(:parent => admin_home,  :name => "Flagged Comments",  :href => "/admin/comments/flagged")
HardLink.create!(:parent => admin_home,  :name => "Search Log",        :href => "/admin/search_log")
HardLink.create!(:parent => admin_home,  :name => "Social Feeds",      :href => "/admin/social_feeds")
HardLink.create!(:parent => admin_home,  :name => "Users",             :href => "/admin/users")

contacts_nav = HardLink.create!(:parent => admin_menu, :name => "Contacts", :href => "/admin/crm/contacts")
HardLink.create!(:parent => contacts_nav, :name => "Companies", :href => "/admin/crm/companies")
HardLink.create!(:parent => contacts_nav, :name => "Deals", :href => "/admin/crm/deals")
HardLink.create!(:parent => contacts_nav, :name => "Leads", :href => "/admin/crm/leads")
HardLink.create!(:parent => contacts_nav, :name => "Menu Manager", :href => "/admin/menu_options")

marketing_nav = HardLink.create!(:parent => admin_menu, :name => "Marketing", :href => "/admin/crm/marketing_report")
HardLink.create!(:parent => marketing_nav, :name => "Campaign Report", :href => "/admin/crm/marketing_report")
HardLink.create!(:parent => marketing_nav, :name => "Activity Report", :href => "/admin/crm/activity")
HardLink.create!(:parent => marketing_nav, :name => "Campaigns", :href => "/admin/crm/campaigns")
HardLink.create!(:parent => marketing_nav, :name => "Campaign Groups", :href => "/admin/crm/campaigns/groups")
HardLink.create!(:parent => marketing_nav, :name => "Offers", :href => "/admin/crm/offers")

email_nav = HardLink.create!(:parent => admin_menu, :name => "Email", :href => "/admin/email")
HardLink.create!(:parent => email_nav, :name => "Delivered", :href => "/admin/email/deliveries")
HardLink.create!(:parent => email_nav, :name => "Email Reports", :href => "/admin/email/reports")
HardLink.create!(:parent => email_nav, :name => "Mailing Lists", :href => "/admin/email/lists")
HardLink.create!(:parent => email_nav, :name => "System Email", :href => "/admin/email/system")

content_nav = HardLink.create!(:parent => admin_menu, :name => "Content",  :href => "/admin/pages")
HardLink.create!(:parent => content_nav, :name => "Blog Posts",        :href => "/admin/blog_posts")
HardLink.create!(:parent => content_nav, :name => "FAQs",              :href => "/admin/faqs")
HardLink.create!(:parent => content_nav, :name => "Layouts",           :href => "/admin/layouts")
HardLink.create!(:parent => content_nav, :name => "Menus",             :href => "/admin/menus/main/submenus")
HardLink.create!(:parent => content_nav, :name => "Pages",             :href => "/admin/pages")
HardLink.create!(:parent => content_nav, :name => "Slides",            :href => "/admin/slides")
HardLink.create!(:parent => content_nav, :name => "Slideshows",        :href => "/admin/slideshows")
HardLink.create!(:parent => content_nav, :name => "System Pages",      :href => "/admin/system_pages")

widget_nav  = HardLink.create!(:parent => admin_menu, :name => "Widgets",  :href => "/admin/feed_widgets")
#HardLink.create!(:parent => widget_nav,  :name => "Banners",           :href => "/admin/banners")
HardLink.create!(:parent => widget_nav,  :name => "Content Feed",      :href => "/admin/feed_widgets")
HardLink.create!(:parent => widget_nav,  :name => "Feed Templates",    :href => "/admin/widget_templates")
HardLink.create!(:parent => widget_nav,  :name => "Polls",             :href => "/admin/polls")
HardLink.create!(:parent => widget_nav,  :name => "Slideshow Widget",  :href => "/admin/slideshow_widgets")
HardLink.create!(:parent => widget_nav,  :name => "Snippets",          :href => "/admin/snippets")
HardLink.create!(:parent => widget_nav,  :name => "Top Content Feed",  :href => "/admin/top_widgets")

setting_nav = HardLink.create!(:parent => admin_menu, :name => "Settings", :href => "/admin/settings")
HardLink.create!(:parent => setting_nav, :name => "Blogs",             :href => "/admin/blogs")
HardLink.create!(:parent => setting_nav, :name => "Content Settings",  :href => "/admin/settings/content")
HardLink.create!(:parent => setting_nav, :name => "Email Settings",    :href => "/admin/settings/email")
HardLink.create!(:parent => setting_nav, :name => "Forums",            :href => "/admin/forums")
HardLink.create!(:parent => setting_nav, :name => "General Settings",  :href => "/admin/settings/general")
HardLink.create!(:parent => setting_nav, :name => "Share Sites",       :href => "/admin/settings/share_sites")
HardLink.create!(:parent => setting_nav, :name => "Social Settings",   :href => "/admin/settings/social")

help_nav    = HardLink.create!(:parent => admin_menu, :name => "Help",              :href => "/admin/help")
