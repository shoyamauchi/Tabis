class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = current_user

    favorites = Favorite.where(user_id: current_user.id).pluck(:tabi_id)  # ログイン中のユーザーのお気に入りのtabi_idカラムを取得
    @favorite_list = Tabi.find(favorites)  # tabisテーブルから、お気に入り登録済みのレコードを取得
  end

  def account
    @user = User.find(params[:id])
    @tabis = @user.tabis
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def tabi_params
      params.require(:tabi).permit(:title, :content, :address, :latitude, :longitude, tabi_photos: []).merge(user_id: current_user.id)
    end
end

