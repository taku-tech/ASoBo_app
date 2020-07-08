class ChangeColumnToWords < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :words, :word_jp, false
  end
end
