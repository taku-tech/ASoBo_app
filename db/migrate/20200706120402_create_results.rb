class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.integer :user, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
