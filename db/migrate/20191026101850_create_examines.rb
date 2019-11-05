class CreateExamines < ActiveRecord::Migration[6.0]
  def change
    create_table :examines do |t|
      t.bigint :question_id
      t.datetime :begindate
      t.datetime :enddate
      t.float :progress
      t.bigint :up_id
      t.bigint :questionstatu_id
      t.bigint :questionpri_id
      t.bigint :user_id
      t.integer :status

      t.timestamps
    end
  end
end
