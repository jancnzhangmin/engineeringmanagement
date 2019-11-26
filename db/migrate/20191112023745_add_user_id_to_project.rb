class AddUserIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :user_id, :bigint
  end
end
