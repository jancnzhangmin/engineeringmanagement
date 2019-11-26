class CreateCollaborates < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborates do |t|
      t.bigint :user_id
      t.bigint :project_id
      t.string :auth

      t.timestamps
    end
  end
end
