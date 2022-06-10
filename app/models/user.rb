class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  
  validates :name, presence: true, length: { maximum: 15, allow_blank: true }

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true, length: { minimum: 8, allow_blank: true }, format: { with: VALID_PASSWORD_REGEX, allow_blank: true }, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 8, allow_blank: true }, format: { with: VALID_PASSWORD_REGEX, allow_blank: true }, allow_nil: true

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX, allow_blank: true }, uniqueness: { case_sensitive: false, allow_blank: true }}


  # 関連付け
  has_many :tabis
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 画像
  has_one_attached :avatar

  def favorite_find(tabi_id)
    favorites.where(tabi_id: tabi_id).exists?
  end
end
