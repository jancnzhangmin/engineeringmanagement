class AddPinyinToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :pinyin, :string
    add_column :contacts, :fullpinyin, :string
  end
end
