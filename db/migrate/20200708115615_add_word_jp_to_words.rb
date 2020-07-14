class AddWordJpToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :word_jp, :string, after: :word
  end
end
