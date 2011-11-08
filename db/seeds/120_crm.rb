########################################################################################################################################

puts "Generating Offer Page"
offer_page = Layout.for(UserPage).prototype!(SystemPage, :title => "Offer Conversion", :author => User.first, :identifier => Offer::Identifiers::PAGE)

########################################################################################################################################

puts "Generating Menu Options"

MenuOption.create!(:key => 'Deal Category', :value => 'Default')

MenuOption.create!(:key => 'Email', :value => 'Work')
MenuOption.create!(:key => 'Email', :value => 'Personal')
MenuOption.create!(:key => 'Email', :value => 'Other')

MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'AIM')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'Google Talk')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'ICQ')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'Jabber')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'MSN')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'QQ')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'Skype')
MenuOption.create!(:key => 'Instant Messaging Handle', :value => 'Yahoo')

MenuOption.create!(:key => 'Website', :value => 'Work')
MenuOption.create!(:key => 'Website', :value => 'Personal')
MenuOption.create!(:key => 'Website', :value => 'Other')

MenuOption.create!(:key => 'Address', :value => 'Work')
MenuOption.create!(:key => 'Address', :value => 'Personal')
MenuOption.create!(:key => 'Address', :value => 'Other')

MenuOption.create!(:key => 'Phone Number', :value => 'Work')
MenuOption.create!(:key => 'Phone Number', :value => 'Personal')
MenuOption.create!(:key => 'Phone Number', :value => 'Mobile')
MenuOption.create!(:key => 'Phone Number', :value => 'Other')

MenuOption.create!(:key => 'School', :value => 'High School')
MenuOption.create!(:key => 'School', :value => 'College')
MenuOption.create!(:key => 'School', :value => 'Graduate Schoole')
