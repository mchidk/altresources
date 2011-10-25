class CreateContactsDeals < ActiveRecord::Migration
  def self.up
    create_table "contacts_deals", :force => true, :id => false do |t|
      t.references :contact, :deal
    end
  end

  def self.down
    drop_table :contacts_deals
  end
end
