class RenameWordJpToTextJpInWord < ActiveRecord::Migration[5.2]
  def change
  	rename_column :words, :word_jp, :text_jp
  end
end
