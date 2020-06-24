class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to blog'
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
