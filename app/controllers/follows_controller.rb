class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:id])
    @user.save
    redirect_back(fallback_location: root_path)
  end
  def destroy

  end

  private

  def follow_params
    params.require(:follow).permit(:user_id)
  end
end
