class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|

      t.integer :user, foreign_key: true
      t.integer :word, foreign_key: true
      t.boolean :is_done, null: false, default: false
      t.timestamps
    end
  end
end
