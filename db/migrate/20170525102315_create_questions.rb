class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :style, default: "choice"
      t.text   :stem
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :answer
      t.text   :note

      t.timestamps
    end
  end
end
