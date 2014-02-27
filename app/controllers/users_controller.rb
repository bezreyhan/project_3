class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:username))
  end

  def new
    @user = User.new
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def post
  end

  def index
    @users = User.all
  end

end
