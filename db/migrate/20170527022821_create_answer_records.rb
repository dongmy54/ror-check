class CreateAnswerRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_records do |t|
      t.string :style, default: "choice"
      t.text   :stem
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :answer
      t.text   :note
      t.string :rep_answer
      t.string :state, default: "temp"
      t.integer :exam_id
      t.integer :user_id

      t.timestamps
    end
  end
end
