if Rails.env.development?
  lorem = <<-LOREM 
  <p>Bibendum euismod, leo diam interdum ligula, eu scelerisque sem purus in tellus.</p>
  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet nunc id quam porta varius. Ut aliquet facilisis turpis. Etiam pellentesque quam et erat. Praesent suscipit justo.  </p>
  <p>Cras nec metus pulvinar sem tempor hendrerit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam in nulla.  Mauris elementum. Curabitur tempor, quam ac rutrum placerat, nunc augue ullamcorper est, vitae molestie neque nunc a nunc. Integer justo dolor, consequat id, rutrum auctor, ullamcorper sed, orci. In hac habitasse platea dictumst. Fusce euismod semper orci. Integer venenatis quam.</p>
  LOREM

  page_layout  = Layout.for(UserPage)
  slide_layout = Layout.for(Slide)
  forum_layout = Layout.for(Forum)
  blog_layout  = Layout.for(Blog)
  slide_layout = Layout.for(Slide)
  admin_layout = Layout.find_by_identifier('user_page_admin')

  author       = User.last
  blog         = Blog.first
  forum        = Forum.first

  n = 10
  puts "Generating #{n} dummy blog posts"
  n.times do |i|
    t = "Blog Post #{i + 1}"
    blog_layout.prototype!(BlogPost, :title => t, :author => author, :body => lorem, :blog => blog, :published => true, :published_at => (DateTime.now - n.days + i.days))
  end

  faqs = %w(guest user employee).map {|a| Faq.create!(:title => "FAQ #{a}", :role => a) }
  faqs[0].questions.create!(:title => "What is a guest question?", :body => lorem, :author => author)
  faqs[1].questions.create!(:title => "What is a user question?", :body => lorem, :author => author)
  faqs[2].questions.create!(:title => "What is a employee question?", :body => lorem, :author => author)
end
