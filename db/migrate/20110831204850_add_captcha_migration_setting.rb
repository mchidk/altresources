class AddCaptchaMigrationSetting < ActiveRecord::Migration
  def self.up
    add_column :settings, :use_captcha_registrations, :boolean
    add_column :settings, :use_captcha_comments, :boolean
  end

  def self.down
    remove_column :settings, :use_captcha_comments
    remove_column :settings, :use_captcha_registrations
  end
end
