class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tabi

  validates_uniqueness_of :tabi_id, scope: :user_id 
end
