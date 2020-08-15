class AddLevelToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :level, :string
  end
end
