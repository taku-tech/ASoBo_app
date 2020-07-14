class CreateChoiceWords < ActiveRecord::Migration[5.2]
  def change
    create_table :choice_words do |t|
      t.integer :word_id, null: false
      t.string :word, null: false
      t.boolean :is_answer, null: false

      t.timestamps
    end
  end
end
