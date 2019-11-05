class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.bigint :project_id
      t.bigint :user_id
      t.string :name
      t.string :summary
      t.float :amount
      t.bigint :assign_id

      t.timestamps
    end
  end
end
