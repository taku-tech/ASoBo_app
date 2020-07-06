class CreateUserResults < ActiveRecord::Migration[5.2]
  def change
    create_table :user_results do |t|

      t.integer :user_id, null: false
      t.integer :admin_id, null: false
      t.timestamps
    end
  end
end
