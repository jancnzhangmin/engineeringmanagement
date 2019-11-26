class AddAdcodeToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :adcode, :string
  end
end
