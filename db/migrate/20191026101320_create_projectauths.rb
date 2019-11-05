class CreateProjectauths < ActiveRecord::Migration[6.0]
  def change
    create_table :projectauths do |t|
      t.bigint :project_id
      t.string :auth
      t.string :keyword
      t.integer :status

      t.timestamps
    end
  end
end
