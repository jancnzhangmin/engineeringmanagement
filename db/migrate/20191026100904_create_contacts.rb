class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.bigint :project_id
      t.bigint :user_id
      t.string :contact
      t.string :phone
      t.datetime :birthday
      t.string :position
      t.string :address
      t.integer :visual

      t.timestamps
    end
  end
end
