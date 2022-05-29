class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = current_user
  end

  def account
    @user = User.find(params[:id])
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
end

