class AddOwnerToTestList < ActiveRecord::Migration
  def change
  	add_column :test_lists, :owner_id, :integer
  end
end