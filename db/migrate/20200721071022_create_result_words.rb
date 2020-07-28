class CreateResultWords < ActiveRecord::Migration[5.2]
  def change
    create_table :result_words do |t|
      t.integer :result_id, null: false
      t.integer :word_id, null: false
      t.string :chose_text, null: false

      t.timestamps
    end
  end
end
