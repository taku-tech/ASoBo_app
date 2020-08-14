class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.references :user, type: :integer, foreign_key: true
      t.integer :score
      t.timestamps
    end
  end
end
