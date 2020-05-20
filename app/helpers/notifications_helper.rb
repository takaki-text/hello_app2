module NotificationsHelper
    def notification_form(notification)
        @visitor = notification.visitor
        @message = nil
        @visitor_message = notification.message_id
        case notification.action
          when "follow" then
            tag.a(notification.visitor.name, href:show2_user_path(@visitor), style:"font-weight: bold;")+"があなたをfollowしました"
          when "message" then
              @message = Message.find_by(id: @visitor_message)
              tag.a(@visitor.name, href:show2_user_path(@visitor), style:"font-weight: bold;")+"から"+tag.a('message',  style:"font-weight: bold;")+"messageが来ました"
        end
    end
    
end
