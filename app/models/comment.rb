class Comment < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 500 }

  belongs_to :user  
  belongs_to :tabi
end
