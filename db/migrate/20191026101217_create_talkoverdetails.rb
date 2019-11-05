class CreateTalkoverdetails < ActiveRecord::Migration[6.0]
  def change
    create_table :talkoverdetails do |t|
      t.text :content
      t.bigint :up_id
      t.bigint :talkover_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
