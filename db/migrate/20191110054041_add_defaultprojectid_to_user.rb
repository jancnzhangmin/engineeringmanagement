class AddDefaultprojectidToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :defaultprojectid, :bigint
  end
end
