class AddNameToNotif < ActiveRecord::Migration[6.0]
  def change
    add_column :notifs, :name, :string
  end
end
