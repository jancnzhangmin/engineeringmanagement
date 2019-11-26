class RemoveProjectIdFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :project_id
  end
end
