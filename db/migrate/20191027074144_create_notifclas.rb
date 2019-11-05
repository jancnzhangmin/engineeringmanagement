class CreateNotifclas < ActiveRecord::Migration[6.0]
  def change
    create_table :notifclas do |t|
      t.string :cla
      t.string :keyword

      t.timestamps
    end
  end
end
