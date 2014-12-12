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
    @user = current_user
    current_user.update_attributes(user_params)
    redirect_to edit_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :address)
  end
end
