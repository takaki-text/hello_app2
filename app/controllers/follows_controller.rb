class FollowsController < ApplicationController
  before_action :logged_in_user
  def create
    @user = User.find(params[:id])
    @follow.save
    redirect_to follows_path
  end
  def destroy

  end

  private

  def follow_params
    params.require(:follow).permit(:user_id)
  end
end
