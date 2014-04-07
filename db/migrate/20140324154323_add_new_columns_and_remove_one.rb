class AddNewColumnsAndRemoveOne < ActiveRecord::Migration
  def change
  	add_column :questions, :owner_id, :integer
    add_column :questions, :test_list_id, :integer
    remove_column :questions, :test_id, :integer
  end
end
