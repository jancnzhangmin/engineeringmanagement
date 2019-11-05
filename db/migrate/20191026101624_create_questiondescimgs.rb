class CreateQuestiondescimgs < ActiveRecord::Migration[6.0]
  def change
    create_table :questiondescimgs do |t|
      t.bigint :questiondesc_id

      t.timestamps
    end
  end
end
