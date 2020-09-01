class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.integer :user_id, foreign_key: true
      t.integer :score
      t.string :level
      t.timestamps
    end
  end
end
