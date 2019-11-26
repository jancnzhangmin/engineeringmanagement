class CreateProjectmodules < ActiveRecord::Migration[6.0]
  def change
    create_table :projectmodules do |t|
      t.bigint :project_id
      t.integer :notice
      t.integer :document
      t.integer :contact
      t.integer :myorder
      t.integer :talkover

      t.timestamps
    end
  end
end
