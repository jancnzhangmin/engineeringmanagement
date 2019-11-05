class CreateQuestionpris < ActiveRecord::Migration[6.0]
  def change
    create_table :questionpris do |t|
      t.string :pri
      t.integer :isdefault

      t.timestamps
    end
  end
end
