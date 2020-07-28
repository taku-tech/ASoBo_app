class AddIsDoneToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :is_done, :boolean, default: false, null: false
  end
end
