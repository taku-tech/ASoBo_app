class CreateResultDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :result_details do |t|

      t.references :word, type: :integer, foreign_key: true
      t.references :result, type: :integer, foreign_key: true
      t.string :selected_choice, null: false
      t.timestamps
    end
  end
end
