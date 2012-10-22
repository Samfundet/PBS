class CreateGroupsMembers < ActiveRecord::Migration
  def up
    create_table :groups_members, :id => false do |t|
      t.integer :member_id
      t.integer :group_id
    end
  end

  def down
    drop_table :groups_members
  end
end
