page_layout  = Layout.for(UserPage)
slide_layout = Layout.for(Slide)
forum_layout = Layout.for(Forum)
blog_layout  = Layout.for(Blog)
admin_layout = Layout.find_by_identifier('user_page_admin')
onecol_layout = Layout.find_by_identifier('user_page_one_column')
home_layout = Layout.find_by_identifier('user_page_home')

author ||= User.last

puts "Generating system pages"
admin_layout.prototype!(SystemPage, :title => "System Master",            :author => author, :identifier => Page::Identifiers::SYSTEM_MASTER, :master => true)
admin_layout.prototype!(SystemPage, :title => "Admin Page",               :author => author, :identifier => Page::Identifiers::ADMIN,         :editable_content => false, :role => 'administrator')
page_layout.prototype!(SystemPage, :title => "Search Results",           :author => author, :identifier => Page::Identifiers::SEARCH,        :editable_content => false)
page_layout.prototype!(SystemPage, :title => "Page Not Found",           :author => author, :identifier => Page::Identifiers::NOT_FOUND)
page_layout.prototype!(SystemPage, :title => "Manage Email Preferences", :author => author, :identifier => Page::Identifiers::UNSUBSCRIBE)
slide_layout.prototype!(SystemPage, :title => "Slides",                   :author => author, :identifier => Page::Identifiers::SLIDES,       :editable_content => false)

puts "Generating public system pages"
admin_layout.prototype!(LinkableSystemPage, :title => "Admin Help",       :author => author, :identifier => Page::Identifiers::ADMIN_HELP,   :permalink => 'help',         :editable_content => true)
blog_layout.prototype!(LinkableSystemPage, :title => "Blog",             :author => author, :identifier => Page::Identifiers::BLOG_INDEX,   :permalink => 'blog',         :editable_content => false)
forum_layout.prototype!(LinkableSystemPage, :title => "Forum",            :author => author, :identifier => Page::Identifiers::FORUM_INDEX,  :permalink => 'forums',       :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "Administrator FAQs", :author => author, :identifier => 'administrator_faqs', :permalink => 'administrator/faqs', :role => 'administrator', :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "Edit My Profile",  :author => author, :identifier => Page::Identifiers::EDIT_PROFILE, :permalink => 'profile/edit', :editable_content => false, :role => 'user')
page_layout.prototype!(LinkableSystemPage, :title => "Employee FAQs",      :author => author, :identifier => 'employee_faqs',      :permalink => 'employee/faqs',      :role => 'employee',      :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "FAQ",              :author => author, :identifier => Page::Identifiers::FAQ,          :permalink => 'faqs',         :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "Profile",          :author => author, :identifier => Page::Identifiers::PROFILE,      :permalink => 'profile',      :editable_content => false, :role => 'user')
page_layout.prototype!(LinkableSystemPage, :title => "Sign In",          :author => author, :identifier => Page::Identifiers::SIGN_IN,      :permalink => 'sign_in',      :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "Sign Up",          :author => author, :identifier => Page::Identifiers::SIGN_UP,      :permalink => 'sign_up',      :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "Slideshows",       :author => author, :identifier => Page::Identifiers::SLIDESHOWS,   :permalink => 'slideshows',   :editable_content => true)
page_layout.prototype!(LinkableSystemPage, :title => "Super User FAQs",    :author => author, :identifier => 'superuser_faqs',     :permalink => 'superuser/faqs',     :role => 'superuser',     :editable_content => false)
page_layout.prototype!(LinkableSystemPage, :title => "User FAQs",          :author => author, :identifier => 'user_faqs',          :permalink => 'user/faqs',          :role => 'user',          :editable_content => false)

home_layout.prototype!(LinkableSystemPage, :title => "Home", :author => author, :identifier => Page::Identifiers::HOME, :permalink => '', :editable_content => true, :display_title => false, :body => <<-TEMPLATE)
<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.</p>
<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla. Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>
TEMPLATE
