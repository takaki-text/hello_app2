class AddRoomIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :room_id, :integer
  end
end
