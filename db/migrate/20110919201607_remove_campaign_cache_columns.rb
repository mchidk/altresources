class RemoveCampaignCacheColumns < ActiveRecord::Migration
  def self.up
    remove_column :campaigns, :new_visits
    remove_column :campaigns, :repeat_visits
  end

  def self.down
    add_column :campaigns, :new_visits, :integer
    add_column :campaigns, :repeat_visits, :integer
  end
end
