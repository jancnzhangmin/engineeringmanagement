class CreateTalkovers < ActiveRecord::Migration[6.0]
  def change
    create_table :talkovers do |t|
      t.bigint :project_id
      t.bigint :user_id
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
