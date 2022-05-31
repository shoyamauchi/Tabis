class FavoritesController < ApplicationController
  before_action :authenticate_user! # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  
  # お気に入り登録
  def create
    @favorite = Favorite.create(user_id: current_user.id, tabi_id: params[:id])
    redirect_to root_path
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(tabi_id: current_user.id, tabi_id: params[:id])
    @favorite.destroy
    redirect_to root_path
  end

end
