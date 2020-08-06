class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
