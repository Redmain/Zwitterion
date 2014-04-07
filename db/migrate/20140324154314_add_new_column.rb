class AddNewColumn < ActiveRecord::Migration
  def change
  	add_column :marks, :user_id, :integer
  	add_column :marks, :test_list_id, :integer
  	add_column :questions, :test_id, :integer
  	add_column :answers, :question_id, :integer
    remove_column :marks, :id_user, :integer
    remove_column :marks, :id_test, :integer
    remove_column :questions, :id_test, :integer
    remove_column :answers, :id_question, :integer
  end
end
