puts "generating system email lists"
email_updates_list      = MailingList.create!(:identifier => MailingList::Identifiers::NEWSLETTER,         :name => "Public Newsletter List", :description => 'Please send me your newsletter', :system => true)
comment_updates_list    = MailingList.create!(:identifier => MailingList::Identifiers::COMMENT_UPDATES,    :name => "Comments and Topics Notification",  :description => 'Email me when people comment on topics & pages that I saved or where I commented', :system => true, :newsletter => false)
new_content_alerts_list = MailingList.create!(:identifier => MailingList::Identifiers::NEW_CONTENT_ALERTS, :name => "New Content Posted Notification",   :description => 'Email me when new content is posted to the site', :system => true, :newsletter => false)

puts "Generating System Emails"
sanitizer = HTML::FullSanitizer.new

#-------------------------------------------------------

opts = {}
opts[:name] = "Reset Password Email"
opts[:identifier] = SystemEmail::Identifiers::RESET_PASSWORD
opts[:subject] = "{{ config.site_name }} send Password Reset Instructions"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>You can reset your password by clicking the link or pasting it into your browser:<br /> #reset_password_url#</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

You can reset your password by clicking the link or pasting it into your browser:
#reset_password_url#

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:mailing_list] = new_content_alerts_list
opts[:name] = "New Content Alert Email"
opts[:identifier] = SystemEmail::Identifiers::NEW_CONTENT_ALERT
opts[:subject] = "{{ config.site_name }} has new content: {{ page.title }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>{{ page.title }} was added to {{ config.site_name }}</p>
<p>You can visit this page by clicking the link or pasting it into your browser:<br />{{ page.url }}</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
<p>To unsubscribe from these alerts, click the link or paste it into your browser:<br />#unsubscribe_url#</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

{{ page.title }} was added to {{ config.site_name }}

You can visit this page by clicking the link or pasting it into your browser:
{{ page.url }}

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!

To unsubscribe from these alerts, click the link or paste it into your browser:
#unsubscribe_url#
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Email a Friend Email"
opts[:identifier] = SystemEmail::Identifiers::FRIEND_EMAIL
opts[:subject] = "I just saw this on {{ config.site_name }} - {{ page.title }}"
opts[:html_body] = <<-BODY
<p>{{ sender.email }} just sent you a link:</p>
<p>{{ email.message }}</p>
<p>You can visit "{{ page.title }}" by clicking the link or pasting it into your browser:<br />{{ page.url }}</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
<p>{{ sender.email }} just sent you a link:</p>
BODY
opts[:text_body] = <<-BODY
{{ sender.email }} just sent you a link:

{{ email.message }}

You can visit "{{ page.title }}" by clicking the link or pasting it into your browser:
{{ page.url }}

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Revocation Confirmation"
opts[:identifier] = SystemEmail::Identifiers::REVOCATION_CONFIRMATION
opts[:subject] = "{{ config.site_name }} -- Your account has been revoked"
opts[:html_body] = <<-BODY
<p>Hello,</p>
<p>The account registered for #email# has been deactivated per your request.</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
BODY
opts[:text_body] = <<-BODY
Hello,

The account registered for #email# has been deactivated per your request.

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Registration Confirmation"
opts[:identifier] = SystemEmail::Identifiers::REVOCATION_INSTRUCTIONS
opts[:subject] = "You are now registered at {{ site.name }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>You are now registered at {% link_to root_url %}.</p>
<p>If you chose to sign up with us, please disregard this email as no further action is required.</p>
<p>However, if this was not you, you can revoke this account by clicking the link or pasting it into your browser:<br />#revoke_account_url#</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team</p><br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

You are now registered at {% link_to root_url %}.

If you chose to sign up with us, please disregard this email as no further action is required.

However, if this was not you, you can revoke this account by clicking the link or pasting it into your browser:
#revoke_account_url# 

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Admin Registrant Notification"
opts[:identifier] = SystemEmail::Identifiers::NEW_REGISTRANT
opts[:subject] = "You have a new registrant at {{ config.site_name }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>There is a new registrant at {{ config.site_name }}'s website.</p>
<p>Visit {% link_to admin_users_url %} to review new registrations.</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

There is a new registrant at {{ config.site_name }}'s website.

Visit {% link_to admin_users_url %} to review new registrations.

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Comment Updates Email"
opts[:mailing_list] = comment_updates_list
opts[:identifier] = SystemEmail::Identifiers::COMMENT_UPDATE
opts[:subject] = "{{ sender.username }} commented on {{ config.site_name }} - {{ page.title }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>To see "{{ page.title }}" and the comments, click on the link or paste it into your browser:<br />{{ page.url }}</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
<p>To unsubscribe from these alerts, click the link or paste it into your browser:<br />#unsubscribe_url#</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

To see "{{ page.title }}" and the comments, click on the link or paste it into your browser:
{{ page.url }}

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!

To unsubscribe from these alerts, click the link or paste it into your browser:
#unsubscribe_url#
BODY
SystemEmail.create!(opts)

#-------------------------------------------------------

opts = {}
opts[:name] = "Offer Conversion Email"
opts[:identifier] = Offer::Identifiers::CONVERSION_EMAIL
opts[:subject] = "Lead for {{ offer.name }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>Someone responded to an offer on {{ config.site_name }}.</p>
<p>{% link_to leads_url text[Review this new lead.] %}</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
BODY
opts[:text_body] = <<-BODY
Someone responded to an offer on {{ config.site_name }}.

{% link_to leads_url text[Review this new lead.] %}

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}
BODY
SystemEmail.create!(opts)

opts = {}
opts[:name] = "Employee Confirmation Email"
opts[:identifier] = SystemEmail::Identifiers::ELEVATION_NOTIFICATION
opts[:subject] = "You have been confirmed as employee of {{ config.site_name }}"
opts[:html_body] = <<-BODY
<p>Dear #first_name#,</p>
<p>You have just been confirmed as a employee of {{ config.site_name }}.</p>
<p>Go to {% link_to edit_profile_url %} to enter your extended profile information.</p>
<p>Many thanks!</p>
<p>The {{ config.site_name }} Team<br />{{ config.can_spam_mailing_address}}</p>
<p>PS: If you have any trouble or have questions, you can simply reply to this email and let us know!</p>
BODY
opts[:text_body] = <<-BODY
Dear #first_name#,

You have just been confirmed as a employee of {{ config.site_name }}.

Go to {% link_to edit_profile_url %} to enter your extended profile information.

Many thanks!

The {{ config.site_name }} Team
{{ config.can_spam_mailing_address}}

PS: If you have any trouble or have questions, you can simply reply to this email and let us know!
BODY
SystemEmail.create!(opts)
