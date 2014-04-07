class AddNewColumns < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :login, :string
  	add_column :users, :mark, :integer, :default => 0

  	add_column :marks, :user_id, :integer
  	add_column :marks, :test_list_id, :integer
  	add_column :marks, :points, :integer, :default => 0
  	
  	add_column :test_lists, :name, :string

  	add_column :questions, :test_list_id, :integer
  	add_column :questions, :text, :string

  	add_column :answers, :question_id, :integer
  	add_column :answers, :text, :string
  end
end
