class AddDatedCostToDeal < ActiveRecord::Migration
  def self.up
    add_column :deals, :dated_cost_id, :integer
  end

  def self.down
    remove_column :deals, :dated_cost_id
  end
end
