class RemoveVisiterIdFromNotifications < ActiveRecord::Migration[5.2]
  def up
    remove_column :notifications, :visiter_id
  end

  def down
  	add_column :notifications, :visiter_id, :integer
  end
end
