class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.references :user, type: :integer, foreign_key: true
      t.references :word, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
