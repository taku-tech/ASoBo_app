class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|

      t.references :user, type: :integer, foreign_key: true
      t.references :word, type: :integer, foreign_key: true
      t.boolean :is_done, null: false, default: false
      t.timestamps
    end
  end
end
