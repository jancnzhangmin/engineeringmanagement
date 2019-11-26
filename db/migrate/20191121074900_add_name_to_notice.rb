class AddNameToNotice < ActiveRecord::Migration[6.0]
  def change
    add_column :notices, :name, :string
  end
end
