class CreateTestLists < ActiveRecord::Migration
  def change
    create_table :test_lists do |t|

      t.timestamps
    end
  end
end
