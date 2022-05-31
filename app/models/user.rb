class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :tabis
  has_many :favorites, dependent: :destroy
  # 画像
  has_one_attached :avatar

  def favorite_find(tabi_id)
    favorites.where(tabi_id: tabi_id).exists?
  end
end
