class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|

      t.integer :admin_id, null: false
      t.integer :genre_id, null: false
      t.string :text_en, null: false
      t.string :text_jp, null: false
      t.string :image_id, null: false
      t.boolean :is_valid, null: false, default: true
      t.timestamps
    end
  end
end
