class CoursesController < ApplicationController
  before_action :authenticate_user!
  def new
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @user = @course.user
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    @course.save
    redirect_to courses_path
  end

  def edit
  end

  def update
  end

  def delete
  end
  private
  def course_params
    params.require(:course).permit(:plan) # tweetモデルのカラムのみを許可
  end
  def after_new_course_path_for(resource)
    root_path
  end
end
