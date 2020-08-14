class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.integer :user, foreign_key: true
      t.integer :word, foreign_key: true
      t.timestamps
    end
  end
end
