class CreateJoinTableAdmingroupAuth < ActiveRecord::Migration[6.0]
  def change
    create_join_table :admingroups, :auths do |t|
      # t.index [:admingroup_id, :auth_id]
      # t.index [:auth_id, :admingroup_id]
    end
  end
end
