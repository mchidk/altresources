puts "Generating default share sites"
start_index = 4

ShareSite.create!(:name => "Facebook", :url => "http://www.facebook.com/sharer.php?u={% page_url | uri_escape %}", :icon_index => 10)
ShareSite.create!(:name => "Twitter", :url => "http://www.twitter.com/home?status=Check%20this%20out:{% page_url | uri_escape %}", :icon_index => 31 )
ShareSite.create!(:name => "Google", :url => "http://www.google.com/bookmarks/mark?op=add&bkmk={% page_url | uri_escape %}&title={% page_title | url_escape %}", :icon_index => 11)
ShareSite.create!(:name => "Google Buzz", :url => "http://www.google.com/buzz/post?url={% page_url | uri_escape %}", :icon_index => 12)
ShareSite.create!(:name => "Kaboodle", :url => "http://www.kaboodle.com/za/selectpage?p_pop=false&pa=url&u={% page_url | uri_escape %}", :icon_index => 14)
ShareSite.create!(:name => "Delicious", :url => "http://delicious.com/post?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}", :icon_index => 5)
ShareSite.create!(:name => "Propellor", :url => "http://propeller.com/story/submit?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}", :icon_index => 21)
ShareSite.create!(:name => "Yahoo! Buzz", :url => "http://buzz.yahoo.com/buzz?src=addthis&targetUrl={% page_url | uri_escape %}&headline={% page_title | uri_escape %}", :icon_index => 1)
ShareSite.create!(:name => "StumbleUpon", :url => "http://www.stumbleupon.com/submit?url={% page_url | uri_escape %}", :icon_index => 29)
ShareSite.create!(:name => "Reddit", :url => "http://www.reddit.com/submit?url={% page_url | uri_escape %}&title={% page_title | uri_escape %}", :icon_index => 22)
ShareSite.create!(:name => "Digg", :url => "http://digg.com/submit?phase=2&url={% page_url | uri_escape %}", :icon_index => 6)
ShareSite.create!(:name => "Mixx", :url => "http://mixx.com/submit?page_url={% page_url | uri_escape %}", :icon_index => 18)
ShareSite.create!(:name => "Technorati", :url => "http://technorati.com/faves?add={% page_url | uri_escape %}", :icon_index => 30)
ShareSite.create!(:name => "LinkedIn", :url => "http://www.linkedin.com/shareArticle?mini=true&url={% page_url | uri_escape %}&title={% page_title | url_escape %}", :icon_index => 17)
