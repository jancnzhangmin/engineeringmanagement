class CreateSystemmodules < ActiveRecord::Migration[6.0]
  def change
    create_table :systemmodules do |t|
      t.integer :notice
      t.integer :document
      t.integer :contact
      t.integer :myorder
      t.integer :talkover

      t.timestamps
    end
  end
end
