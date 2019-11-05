class CreateOrderdetails < ActiveRecord::Migration[6.0]
  def change
    create_table :orderdetails do |t|
      t.bigint :order_id
      t.string :name
      t.float :number
      t.float :price
      t.float :total

      t.timestamps
    end
  end
end
