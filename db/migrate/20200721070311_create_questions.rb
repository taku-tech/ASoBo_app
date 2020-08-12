class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|

      t.references :user, foreign_key: true
      t.references :word, foreign_key: true
      t.boolean :is_done, null: false, default: false
      t.timestamps
    end
  end
end
