class ChangeWordToTextInWord < ActiveRecord::Migration[5.2]
  def change
    rename_column :words, :word, :text
  end
end
