class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :theme
      t.text :require
      t.datetime :begindate
      t.datetime :enddate
      t.float :progress
      t.bigint :up_id
      t.bigint :questionstatu_id
      t.bigint :questionpri_id
      t.bigint :user_id
      t.bigint :project_id

      t.timestamps
    end
  end
end
