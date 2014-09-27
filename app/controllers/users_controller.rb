class UsersController < ApplicationController

  #Don't worry about index for now
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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

  private
    def user_params
      params.require(:user).permit(:name, :age, :major)
    end
end
