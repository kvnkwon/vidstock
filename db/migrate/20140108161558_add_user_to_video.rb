class AddUserToVideo < ActiveRecord::Migration
  def up
    add_column :videos, :user_id, :integer, null: false
  end

  def down
    remove_column :videos, :user_id
  end
end
