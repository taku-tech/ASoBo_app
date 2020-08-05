class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|

      t.references :genre, foreign_key: true
      t.string :english, null: false
      t.string :japanese, null: false
      t.string :image_id, null: false
      t.boolean :is_valid, null: false, default: true
      t.timestamps
    end
    add_index :words, :english
    add_index :words, :japanese
  end
end
