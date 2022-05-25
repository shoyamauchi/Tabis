class Tabi < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # 関連付け
  belongs_to :user
  # 画像
  has_one_attached :avatar
  has_many_attached :tabi_photos
end
