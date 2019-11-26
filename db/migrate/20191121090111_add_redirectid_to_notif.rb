class AddRedirectidToNotif < ActiveRecord::Migration[6.0]
  def change
    add_column :notifs, :redirect_id, :bigint
  end
end
