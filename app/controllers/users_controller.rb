class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @users = User.all
      render 'index'
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:name, :age)
    end
end
