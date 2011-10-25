# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111021191501) do

  create_table "advertising_costs", :force => true do |t|
    t.integer "cost", :default => 0
    t.date    "date"
  end

  create_table "campaign_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "campaign_group_id"
    t.integer  "affiliate_id"
    t.integer  "sales_person_id"
    t.string   "code",              :limit => 32
    t.integer  "affiliate_fee",                   :default => 0
    t.integer  "sales_fee",                       :default => 0
    t.boolean  "active",                          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["campaign_group_id"], :name => "index_campaigns_on_campaign_group_id"
  add_index "campaigns", ["code"], :name => "index_campaigns_on_code"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.string   "role"
    t.integer  "user_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.boolean  "display_slide_selector", :default => true
    t.integer  "layout_id"
    t.string   "thumb"
    t.text     "description"
  end

  add_index "categories", ["permalink"], :name => "index_categories_on_permalink", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.boolean  "deleted",          :default => false
    t.integer  "deleter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "avatar"
    t.string   "status"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info"
    t.boolean  "ok_to_email", :default => true
  end

  add_index "contacts", ["company_id"], :name => "index_contacts_on_company_id"

  create_table "contacts_deals", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "deal_id"
  end

  create_table "content_updates", :force => true do |t|
    t.integer  "content_id"
    t.string   "content_type"
    t.string   "sub_content_type"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_views", :force => true do |t|
    t.string   "type"
    t.string   "permalink"
    t.boolean  "published",                      :default => false
    t.boolean  "master",                         :default => false
    t.string   "identifier"
    t.boolean  "hidden",                         :default => false
    t.integer  "blog_id"
    t.integer  "forum_id"
    t.integer  "comments_count",                 :default => 0
    t.integer  "user_id"
    t.string   "title"
    t.string   "role"
    t.text     "body"
    t.text     "text_version"
    t.text     "meta_description"
    t.boolean  "display_social_bookmarks"
    t.boolean  "display_date"
    t.boolean  "display_author_info"
    t.boolean  "display_labels"
    t.boolean  "allow_comments"
    t.boolean  "previously_published",           :default => false
    t.datetime "published_at"
    t.datetime "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "layout_id"
    t.boolean  "editable_content",               :default => true
    t.string   "author_string"
    t.integer  "faq_id"
    t.integer  "position"
    t.boolean  "social_feed_settings_completed", :default => false
    t.string   "image"
    t.string   "thumb"
    t.boolean  "display_title",                  :default => true
    t.boolean  "display_actions"
    t.string   "link_text"
    t.boolean  "display_more_info"
  end

  add_index "content_views", ["permalink"], :name => "index_pages_on_permalink", :unique => true

  create_table "dated_costs", :force => true do |t|
    t.integer  "costable_id"
    t.string   "costable_type"
    t.integer  "cost",          :default => 0
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "category"
    t.string   "lead_email"
    t.string   "lead_name"
    t.text     "info"
    t.text     "options"
    t.integer  "offer_id"
    t.integer  "campaign_id"
    t.integer  "tracking_cookie_id"
    t.integer  "contact_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "converted_at"
    t.datetime "closed_at"
    t.string   "status",             :limit => 32
    t.integer  "value",                            :default => 0
    t.string   "offer_name"
    t.string   "campaign_code"
    t.integer  "dated_cost_id"
  end

  add_index "deals", ["campaign_id"], :name => "index_deals_on_campaign_id"
  add_index "deals", ["offer_id"], :name => "index_deals_on_offer_id"
  add_index "deals", ["status"], :name => "index_deals_on_status"
  add_index "deals", ["tracking_cookie_id"], :name => "index_deals_on_tracking_cookie_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "email_deliveries", :force => true do |t|
    t.integer  "campaign_id"
    t.integer  "email_id"
    t.string   "subject"
    t.string   "to"
    t.string   "from"
    t.string   "reply_to"
    t.string   "formats"
    t.text     "message"
    t.text     "html_body"
    t.text     "text_body"
    t.text     "contact_ids"
    t.integer  "requests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.integer  "mailing_list_id"
    t.string   "name"
    t.string   "type"
    t.string   "subject"
    t.boolean  "active",          :default => true
    t.string   "identifier"
    t.string   "to"
    t.string   "from"
    t.string   "reply_to"
    t.text     "html_body"
    t.text     "text_body"
    t.date     "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sub_type"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "favoritable_id"
    t.string   "favoritable_type"
    t.string   "sub_favoritable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "flags", :force => true do |t|
    t.integer  "flaggable_id"
    t.string   "flaggable_type"
    t.integer  "user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "friend_emails", :force => true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.string   "recipient_email"
    t.string   "sender_email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hits", :force => true do |t|
    t.integer  "hittable_id"
    t.string   "hittable_type"
    t.date     "created_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_spec_id"
    t.string   "imaged_type"
    t.integer  "imaged_id"
    t.integer  "position"
  end

  create_table "layouts", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.string   "template"
    t.string   "preview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layout_preview"
    t.boolean  "system",         :default => false
    t.integer  "parent_id"
    t.string   "role"
    t.boolean  "prototypeable",  :default => false
    t.string   "image"
  end

  create_table "layouts_region_types", :id => false, :force => true do |t|
    t.integer "layout_id"
    t.integer "region_type_id"
  end

  create_table "links", :force => true do |t|
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.string   "sub_linkable_type"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailing_lists", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "role"
    t.string   "description"
    t.integer  "subscriptions_count", :default => 0
    t.boolean  "system",              :default => false
    t.boolean  "newsletter",          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_options", :force => true do |t|
    t.integer "position"
    t.string  "key"
    t.string  "value"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.integer  "link_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.boolean  "new_window",             :default => false
    t.boolean  "external",               :default => false
    t.boolean  "system",                 :default => false
    t.boolean  "logged_out_only",        :default => false
    t.boolean  "delegate_title_to_link", :default => true
    t.string   "href"
    t.string   "toggle_eval"
    t.string   "icon"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path_pattern"
    t.string   "type"
    t.boolean  "editable",               :default => true
  end

  create_table "nodes", :force => true do |t|
    t.integer  "renderable_id"
    t.integer  "region_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_responses", :force => true do |t|
    t.integer  "offer_id"
    t.integer  "campaign_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.string   "type"
    t.integer  "offer_id"
    t.integer  "campaign_id"
    t.integer  "tracking_cookie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "converted_at"
    t.string   "status",             :limit => 32
  end

  create_table "page_views", :force => true do |t|
    t.integer  "tracking_cookie_id"
    t.integer  "campaign_id"
    t.string   "request_path",       :limit => 200
    t.string   "user_agent",         :limit => 200
    t.string   "referer",            :limit => 200
    t.string   "session",            :limit => 32
    t.string   "remote_ip",          :limit => 16
    t.boolean  "new_visit",                         :default => false
    t.datetime "created_at"
  end

  add_index "page_views", ["campaign_id"], :name => "index_page_views_on_campaign_id"
  add_index "page_views", ["tracking_cookie_id"], :name => "index_page_views_on_tracking_cookie_id"

  create_table "poll_answers", :force => true do |t|
    t.integer "poll_id"
    t.integer "votes",   :default => 0
    t.text    "value"
  end

  create_table "questions", :force => true do |t|
    t.integer  "faq_id"
    t.integer  "user_id"
    t.integer  "position"
    t.string   "title"
    t.string   "author_text"
    t.datetime "published_at"
    t.text     "answer"
    t.text     "text_version"
    t.boolean  "display_author_info", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "record_attributes", :force => true do |t|
    t.string  "type"
    t.integer "record_id"
    t.string  "record_type"
    t.text    "value"
    t.text    "options"
  end

  create_table "region_types", :force => true do |t|
    t.string  "name"
    t.string  "domid"
    t.string  "role"
    t.boolean "layout_only", :default => false
    t.string  "identifier"
  end

  add_index "region_types", ["identifier"], :name => "index_region_types_on_identifier", :unique => true

  create_table "region_types_renderables", :id => false, :force => true do |t|
    t.integer "region_type_id"
    t.integer "renderable_id"
  end

  create_table "regions", :force => true do |t|
    t.integer  "view_id"
    t.string   "view_type"
    t.integer  "region_type_id"
    t.string   "name"
    t.string   "domid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "renderables", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "template"
    t.text     "revert_template"
    t.string   "file"
    t.integer  "associated_id"
    t.boolean  "system",          :default => false
    t.integer  "width"
    t.integer  "height"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "template_id"
    t.text     "options"
  end

  create_table "searches", :force => true do |t|
    t.string   "query"
    t.string   "search_type"
    t.string   "role"
    t.integer  "user_id"
    t.integer  "results_count"
    t.integer  "search_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.boolean  "debug_mode"
    t.string   "site_name"
    t.string   "copyright_start_year"
    t.string   "domain_name"
    t.text     "default_meta_description"
    t.text     "default_meta_keywords"
    t.text     "google_analytics_code"
    t.text     "google_site_verification_code"
    t.integer  "avatar_size"
    t.integer  "content_icon_size"
    t.integer  "menu_icon_size"
    t.integer  "share_site_icon_size"
    t.integer  "layout_preview_width"
    t.integer  "layout_preview_height"
    t.boolean  "page_show_date"
    t.boolean  "page_show_social_bookmarks"
    t.boolean  "page_show_author_info"
    t.boolean  "page_show_labels"
    t.boolean  "page_allow_comments"
    t.string   "page_submenu"
    t.string   "home_page_title"
    t.string   "forums_page_title"
    t.string   "blog_page_title"
    t.string   "faqs_page_title"
    t.string   "sign_in_page_title"
    t.string   "sign_up_page_title"
    t.string   "proile_page_title"
    t.string   "edit_profile_page_title"
    t.string   "blog_view"
    t.string   "blog_submenu"
    t.integer  "blog_pagination_records"
    t.integer  "blog_teaser_body_length"
    t.boolean  "blog_show_date"
    t.boolean  "blog_show_social_bookmarks"
    t.boolean  "blog_show_author_info"
    t.boolean  "blog_show_labels"
    t.boolean  "blog_allow_comments"
    t.integer  "forum_pagination_records"
    t.boolean  "faq_show_date"
    t.boolean  "faq_show_author_info"
    t.integer  "menu_record_count"
    t.integer  "feed_records"
    t.integer  "feed_summary_characters"
    t.integer  "feed_max_title_characters"
    t.integer  "records_per_page"
    t.integer  "search_records_per_page"
    t.integer  "home_records_per_page"
    t.integer  "admin_records_per_page"
    t.integer  "excerpt_display_chars"
    t.integer  "maximum_share_site_count"
    t.string   "sales_email"
    t.string   "contact_form_page_title"
    t.text     "contact_form_page_text"
    t.string   "contact_thanks_page_title"
    t.text     "contact_thanks_page_text"
    t.text     "add_sales_contact_intro"
    t.string   "site_email_address"
    t.text     "default_html_email"
    t.text     "default_text_email"
    t.boolean  "display_custom_help"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_app_id"
    t.string   "facebook_app_secret"
    t.string   "facebook_access_token"
    t.string   "twitter_app_id"
    t.string   "twitter_app_secret"
    t.string   "twitter_access_token"
    t.string   "twitter_secret_token"
    t.string   "facebook_company_page_url"
    t.string   "facebook_company_page_id"
    t.text     "facebook_page_template"
    t.boolean  "facebook_pages_by_default",      :default => true
    t.text     "facebook_forum_template"
    t.boolean  "facebook_forums_by_default",     :default => true
    t.text     "twitter_page_template"
    t.boolean  "twitter_pages_by_default",       :default => true
    t.text     "twitter_forum_template"
    t.boolean  "twitter_forums_by_default",      :default => true
    t.string   "twitter_company_page_url"
    t.integer  "default_menu_truncation"
    t.string   "bitly_username"
    t.string   "bitly_api_key"
    t.string   "e9_admin_home_blog_url"
    t.string   "e9_admin_home_page_url"
    t.string   "favicon"
    t.string   "default_content_icon"
    t.boolean  "slide_show_social_bookmarks"
    t.boolean  "slide_show_date"
    t.boolean  "slide_show_author_info"
    t.boolean  "slide_show_labels"
    t.boolean  "slide_allow_comments"
    t.integer  "slide_embeddable_width"
    t.integer  "slide_embeddable_height"
    t.integer  "slide_pagination_records"
    t.string   "avatar"
    t.string   "user_page_thumb"
    t.string   "blog_post_thumb"
    t.string   "question_thumb"
    t.integer  "wide_thumb_width"
    t.integer  "wide_thumb_height"
    t.string   "linked_in_company_page_url"
    t.integer  "banner_width"
    t.integer  "banner_height"
    t.text     "e9_standard_help"
    t.text     "e9_custom_help"
    t.boolean  "facebook_slides_by_default"
    t.boolean  "facebook_blog_posts_by_default"
    t.boolean  "facebook_slideshows_by_default"
    t.boolean  "twitter_slides_by_default"
    t.boolean  "twitter_blog_posts_by_default"
    t.boolean  "twitter_slideshows_by_default"
    t.text     "header_text"
    t.text     "email_style_block"
    t.boolean  "page_display_actions"
    t.boolean  "blog_display_actions"
    t.boolean  "slide_display_actions"
    t.integer  "layout_image_width"
    t.integer  "layout_image_height"
    t.boolean  "slide_display_more_info"
    t.boolean  "use_captcha_registrations"
    t.boolean  "use_captcha_comments"
    t.string   "smtp_username"
    t.string   "smtp_password"
    t.string   "smtp_domain"
    t.string   "smtp_url"
    t.string   "system_mailing_address"
    t.text     "can_spam_mailing_address"
  end

  create_table "share_sites", :force => true do |t|
    t.string   "name"
    t.text     "url"
    t.integer  "position"
    t.boolean  "enabled",    :default => true
    t.integer  "icon_index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slide_shows", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slideshow_assignments", :force => true do |t|
    t.integer "slide_id"
    t.integer "slideshow_id"
    t.integer "position"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mailing_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unsubscribe_token"
  end

  add_index "subscriptions", ["unsubscribe_token"], :name => "index_subscriptions_on_unsubscribe_token", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "sub_taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "role"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "css_class"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.integer  "comments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracking_cookies", :force => true do |t|
    t.integer  "user_id"
    t.string   "hid",        :limit => 32
    t.string   "code",       :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracking_cookies", ["code"], :name => "index_tracking_cookies_on_code"
  add_index "tracking_cookies", ["hid"], :name => "index_tracking_cookies_on_hid"
  add_index "tracking_cookies", ["user_id"], :name => "index_tracking_cookies_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",              :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                                  :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "role"
    t.boolean  "auto_favorite",                                  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "subscriptions_token"
    t.boolean  "content_notifications",                          :default => true
    t.boolean  "comment_and_topic_notifications",                :default => true
    t.string   "revocation_token"
    t.datetime "revoked_at"
    t.string   "status",                          :limit => 32
    t.integer  "contact_id"
    t.text     "options"
    t.text     "bio"
    t.string   "company"
    t.string   "title"
    t.date     "dob"
    t.boolean  "has_bounced",                                    :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
