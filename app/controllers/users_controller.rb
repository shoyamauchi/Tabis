class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
end

