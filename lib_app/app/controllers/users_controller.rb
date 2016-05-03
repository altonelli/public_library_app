class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password)
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end
  def show
    @user = User.find_by_id(params[:id])
  end
end
