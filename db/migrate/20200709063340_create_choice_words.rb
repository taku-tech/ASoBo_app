class CreateChoiceWords < ActiveRecord::Migration[5.2]
  def change
    create_table :choice_words do |t|
      t.integer :word_id, null: false
      t.string :text_en, null: false

      t.timestamps
    end
  end
end
