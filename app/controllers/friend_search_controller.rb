class FriendSearchController < ApplicationController
  def index
    @users = User.all
    if !params[:username].blank?
      @users = @users.where("username Like ?", "%#{params[:username]}%")
    end

    if !params[:email].blank?
      @users = @users.where("username Like ?", "%#{params[:email]}%")
    end
  end
end

