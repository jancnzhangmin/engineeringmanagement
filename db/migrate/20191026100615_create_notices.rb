class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.bigint :project_id
      t.bigint :user_id
      t.text :notice

      t.timestamps
    end
  end
end
