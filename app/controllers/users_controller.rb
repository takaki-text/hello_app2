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
end
