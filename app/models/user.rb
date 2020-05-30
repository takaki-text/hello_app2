class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

         :recoverable, :rememberable, :validatable

         validates :name, presence: true  #nameの空欄を許さない
         enum sex: { man: 1, woman: 2 }

         attr_accessor :current_password
         mount_uploader :image, ImageUploader
         has_many :courses
         has_many :demands
         has_many :follows
         has_many :followings, through: :follows, source: :follow
         has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_follows, source: :user
         has_many :messages, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
         has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
         acts_as_paranoid
         def follow(other_user)
          unless self == other_user
            self.follows.find_or_create_by(follow_id: other_user.id)
          end
         end
      
         def unfollow(other_user)
          follow = self.follows.find_by(follow_id: other_user.id)
          follow.destroy if follow
         end
      
         def following?(other_user)
          self.followings.include?(other_user)
         end
         def create_notification_follow!(current_user)
          temp = Notification.where(visitor_id: current_user.id).where(visited_id: id).where(action: 'follow')
          if temp.blank?
            notification = current_user.active_notifications.new(
              visited_id: id,
              action: 'follow'
            )
            notification.save if notification.valid?
          end
         end
      
        
         acts_as_taggable
         def active_for_authentication?
          super && (self.deleted_at == false)
         end
end
