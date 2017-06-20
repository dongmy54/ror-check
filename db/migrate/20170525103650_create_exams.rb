class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.integer  :user_id
      t.integer  :score
      t.integer  :correct_quantity
      t.integer  :total_quantity

      t.timestamps
    end
  end
end
