class AddDoNotEmailColumnToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :ok_to_email, :boolean, :default => true
  end

  def self.down
    remove_column :contacts, :ok_to_email
  end
end
