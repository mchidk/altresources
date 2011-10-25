lorem = <<-LOREM 
<p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>
<p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>
LOREM

blog  ||= Blog.first
forum ||= Forum.first

main_menu = Menu.create!(:identifier => "main_menu", :name => "Main Menu", :system => true)
header_menu = Menu.create!(:name => "Top Nav Menu", :identifier => "top_nav_menu", :system => true)
footer_menu = Menu.create!(:name => "Footer", :identifier => "footer_menu", :system => true)

########################################################################################################################################
puts "Building Menus"

HardLink.create!(:parent => header_menu, :name => 'Admin', :href => '/admin', :role => 'administrator')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::PROFILE).link, :role => 'user')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::EDIT_PROFILE).link, :role => 'user')
HardLink.create!(:parent => header_menu, :name => 'Sign Out', :href => '/sign_out', :role => 'user')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::SIGN_IN).link, :role => 'guest', :logged_out_only => true)
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::SIGN_UP).link, :role => 'guest', :logged_out_only => true)

page_layout = Layout.for(UserPage)
author      = User.last

services   = page_layout.prototype!(UserPage, :title => "Services", :author => author, :body => lorem, :published => true)
about_us   = page_layout.prototype!(UserPage, :title => "About Us", :author => author, :body => lorem, :published => true)
contact_us = page_layout.prototype!(UserPage, :title => "Contact Us", :author => author, :body => lorem, :published => true)

SoftLink.create!(:parent => footer_menu, :link => about_us.link)
SoftLink.create!(:parent => footer_menu, :link => services.link)
HardLink.create!(:parent => footer_menu, :name => 'Blog', :href => blog.path)
SoftLink.create!(:parent => footer_menu, :link => Page.find_by_identifier(Page::Identifiers::FAQ).link)
SoftLink.create!(:parent => footer_menu, :link => contact_us.link)

SoftLink.create!(:parent => main_menu, :link => Page.find_by_identifier(Page::Identifiers::HOME).link)
SoftLink.create!(:parent => main_menu, :link => about_us.link)
SoftLink.create!(:parent => main_menu, :link => services.link)
SoftLink.create!(:parent => main_menu, :link => blog.link)
SoftLink.create!(:parent => main_menu, :link => forum.link)
