puts "generating default users"

admin    = User.create!(:email => "admin@e9digital.com",     :first_name => "Admin",    :last_name => '',         :username => "admin",    :role => :e9_user,   :password => "a11111",     :password_confirmation => "a11111")
conrad   = User.create!(:email => "conrad@e9digital.com",    :first_name => "Conrad",   :last_name => "Strabone", :username => "conrad",   :role => :superuser, :password => "a11111",     :password_confirmation => "a11111")
jina     = User.create!(:email => "jina@e9digital.com",      :first_name => "Jina",     :last_name => "Kiem",     :username => "jina",     :role => :superuser, :password => "jinakiem",   :password_confirmation => "jinakiem")
travis   = User.create!(:email => "travis@e9digital.com",    :first_name => "Travis",   :last_name => "",         :username => "travis",   :role => :superuser, :password => "asdfasdf",   :password_confirmation => "asdfasdf")
john     = User.create!(:email => "chris@e9digital.com",     :first_name => "Chris",    :last_name => "",         :username => "chris",   :role => :superuser, :password => "asdfasdf",   :password_confirmation => "asdfasdf")
