class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.bigint :project_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
