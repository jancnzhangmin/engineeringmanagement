class CreateNotifs < ActiveRecord::Migration[6.0]
  def change
    create_table :notifs do |t|
      t.bigint :user_id
      t.bigint :notifcla_id
      t.text :message
      t.integer :unread

      t.timestamps
    end
  end
end
