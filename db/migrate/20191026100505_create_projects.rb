class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :summary
      t.datetime :begindate
      t.datetime :enddate
      t.integer :examine

      t.timestamps
    end
  end
end
