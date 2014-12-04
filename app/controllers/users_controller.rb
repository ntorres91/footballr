class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?

      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def show
    @posts = current_user.posts
  end

  def update
    update_attributes(:longitude, :latitude)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def update_user_params
    params.require(:user).permit(:longitude, :latitude)
  end
end
