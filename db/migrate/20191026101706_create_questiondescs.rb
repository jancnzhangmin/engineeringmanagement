class CreateQuestiondescs < ActiveRecord::Migration[6.0]
  def change
    create_table :questiondescs do |t|
      t.bigint :question_id
      t.bigint :user_id
      t.text :desc

      t.timestamps
    end
  end
end
