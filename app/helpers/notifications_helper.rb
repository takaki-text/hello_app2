module NotificationsHelper
    def notification_form(notification)
        @visiter = notification.visiter
        @message = nil
        your_item = link_to 'あなたの投稿', room_path(notification), style:"font-weight: bold;"
        @visiter_message = notification.message_id
        #notification.actionがfollowかlikeかcommentか
        case notification.action
          when "follow" then
            tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"があなたをfollowしました"
          when "message" then
              @comment = Message.find_by(id: @visiter_message)
              tag.a(@visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"から"+tag.a('', href:users_item_path(notification.item_id), style:"font-weight: bold;")+"messageが来ました"
        end
    end
    
end
