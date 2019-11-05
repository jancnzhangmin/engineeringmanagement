class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.bigint :project_id
      t.string :name
      t.string :nickname
      t.string :headurl
      t.string :openid
      t.string :login
      t.string :password_digest
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
