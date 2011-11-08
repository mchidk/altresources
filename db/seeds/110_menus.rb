puts "Building Menus"

main_menu   = Menu.create!(:name => "Main Menu", :identifier => "main_menu", :system => true)
header_menu = Menu.create!(:name => "Top Nav Menu", :identifier => "top_nav_menu", :system => true)
footer_menu = Menu.create!(:name => "Footer", :identifier => "footer_menu", :system => true)

########################################################################################################################################

HardLink.create!(:parent => header_menu, :name => 'Admin', :href => '/admin', :role => 'administrator')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::PROFILE).link, :role => 'user')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::EDIT_PROFILE).link, :role => 'user')
HardLink.create!(:parent => header_menu, :name => 'Sign Out', :href => '/sign_out', :role => 'user')
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::SIGN_IN).link, :role => 'guest', :logged_out_only => true)
SoftLink.create!(:parent => header_menu, :link => Page.find_by_identifier(Page::Identifiers::SIGN_UP).link, :role => 'guest', :logged_out_only => true)
