class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  def create_notification_message(current_user, message_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Entry.select(:user_id).where(room_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message(current_user, message_id, temp_id['user_id'])
    end

  end

  def save_notification_message(current_user, message_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      room_id: id,
      message_id: message_id,
      visited_id: visited_id,
      action: 'message'
    )
    notification.save if notification.valid?
  end
end