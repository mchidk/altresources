class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :bio, :text
    add_column :users, :company, :string
    add_column :users, :title, :string
    add_column :users, :dob, :date
  end

  def self.down
    remove_column :users, :dob
    remove_column :users, :title
    remove_column :users, :company
    remove_column :users, :bio
  end
end
