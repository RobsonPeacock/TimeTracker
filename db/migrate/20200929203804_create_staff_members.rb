class CreateStaffMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_members do |t|
      t.integer :staff_member_id
      t.integer :user_id

      t.timestamps
    end
  end
end
