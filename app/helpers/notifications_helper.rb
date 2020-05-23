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
            tag.a(notification.visitor.name, href:show2_user_path(@visitor), style:"font-weight: bold;")+"があなたをfollowしました"
          when "message" then
              @message = Message.find_by(id: @visitor_message)
              tag.a(@visitor.name, href:show2_user_path(@visitor), style:"font-weight: bold;")+"から"+tag.a('message', href:rooms/(@roomId), style:"font-weight: bold;")+"が来ました"
        end
    end
    
end

