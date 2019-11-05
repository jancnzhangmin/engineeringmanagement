class CreateQuestionstatus < ActiveRecord::Migration[6.0]
  def change
    create_table :questionstatus do |t|
      t.string :statu
      t.integer :isdefault

      t.timestamps
    end
  end
end
