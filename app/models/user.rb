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
      
        
         acts_as_taggable
        
end
