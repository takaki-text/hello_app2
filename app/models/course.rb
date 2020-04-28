class Course < ApplicationRecord
    belongs_to :user
    acts_as_taggable
    validates :plan, presence: true 
end
