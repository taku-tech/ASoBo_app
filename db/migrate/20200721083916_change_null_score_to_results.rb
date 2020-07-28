class ChangeNullScoreToResults < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :results, :score, true
  end
end
