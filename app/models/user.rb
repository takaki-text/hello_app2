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
        
end
