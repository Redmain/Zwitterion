class AddAnswerToQuestion < ActiveRecord::Migration
  def change
  	add_column :answers, :answer_value, :boolean, default: false  
  end
end