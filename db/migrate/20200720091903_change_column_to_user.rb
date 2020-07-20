class ChangeColumnToUser < ActiveRecord::Migration[5.2]

  	def up
  		change_column :users, :email, :string, default: nil
  	end
  	
  	def down
  		change_column :users, :email, :string, default: ""
  	end
end