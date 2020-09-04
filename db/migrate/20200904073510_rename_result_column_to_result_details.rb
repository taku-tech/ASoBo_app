class RenameResultColumnToResultDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :result_details, :result, :result_id
  end
end
