class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|

      t.integer :user_id, null: false
      t.integer :admin_id, null: false
      t.integer :genre_id, null: false
      t.string :word, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
