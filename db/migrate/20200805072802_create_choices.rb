class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|

      t.integer :word, foreign_key: true
      t.string :content, null: false
      t.timestamps
    end
  end
end
