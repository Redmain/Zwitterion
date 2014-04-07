class AddNewColumnsInToUsersAndQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :owner_id, :integer
  	add_column :users, :state, :string, :default => "unapproved"
  end
end