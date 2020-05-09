class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @demands = @user.demands
  end
  def index
    @user = User.all
    @courses = @user.courses
  end
  def show2
    @user = User.find(params[:id])
    @courses = @user.courses
    @demands = @user.demands
  end
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
  @user  = User.find(params[:id])
  @users = @user.followers
  render 'show_follower'
  end
end
