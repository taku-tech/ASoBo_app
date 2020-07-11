class RemoveIsAnswerFromChoiceWords < ActiveRecord::Migration[5.2]
  def change
    remove_column :choice_words, :is_answer, :boolean
  end
end
