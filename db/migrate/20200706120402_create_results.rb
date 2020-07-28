class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.integer :user_id, null: false
      t.integer :score, null: false
      t.timestamps
    end
  end
end
