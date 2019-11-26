class AddIscompleteToQuestionstatu < ActiveRecord::Migration[6.0]
  def change
    add_column :questionstatus, :iscomplete, :integer
  end
end
