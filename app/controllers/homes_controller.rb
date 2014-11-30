class HomesController < ApplicationController
  before_action: check_if_signed_in

  def show
    @user = User.new
  end

  def check_if_signed_in
    redirect_to dashboard_path

end
