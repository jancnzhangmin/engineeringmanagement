class CreateAdmingroups < ActiveRecord::Migration[6.0]
  def change
    create_table :admingroups do |t|
      t.bigint :user_id
      t.string :name

      t.timestamps
    end
  end
end
