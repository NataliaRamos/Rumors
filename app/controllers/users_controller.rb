class UsersController < ApplicationController
  before_action :find_user, only: [:show,:index,:create,:new]

  def new
  end

  def show
    @user = User.find(params[:id])
    @rumors = @user.rumors
    @rumors_create = User.find(session[:id]).rumors.all
    @rumors_liked = @user.rumors_liked.group(:id).order(:id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to "/rumors"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def destroy
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  def find_user
    @user = session[:id] ? User.find(session[:id]) : User.new
  end
end
