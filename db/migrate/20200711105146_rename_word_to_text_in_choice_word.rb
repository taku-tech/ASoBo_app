class RenameWordToTextInChoiceWord < ActiveRecord::Migration[5.2]
  def change
    rename_column :choice_words, :word, :text
  end
end
