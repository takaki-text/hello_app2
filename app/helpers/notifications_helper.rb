module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @message = nil
    @visitor_message = notification.message_id
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @visitor.id)
     @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @roomId = cu.room_id
          end
        end
     end

      case notification.action
       when "follow" then
        tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"があなたをfollowしました"
       when "message" then
        @message = Message.find_by(id: @visitor_message)
        tag.a(@visitor.name, href:user_path(@visitor), style:"font-weight: bold;")+"から"+tag.a('message', href: room_path(@roomId), style:"font-weight: bold;")+"が来ました"
      end
  end
  def unchecked_notifications
      @notifications = current_user.passive_notifications.where(checked: false)
  end
    
    
end

