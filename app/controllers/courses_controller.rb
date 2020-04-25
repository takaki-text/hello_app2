class CoursesController < ApplicationController
  
  def new
    @course = Course.new
  end
  
  def index
    @courses = Course.all
    
  end

  def show
    @course = Course.find(params[:id])
    @courses = @course.user.courses
    @user = @course.user
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    @course.save
    redirect_to courses_path
  end

  def edit
    @course = Course.find_by(id:params[:id])
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.update(plan: params[:plan])
    redirect_to("/")
  end

  def delete
  end
  private
  def course_params
    params.require(:course).permit(:plan)# tweetモデルのカラムのみを許可
  end
  def after_new_course_path_for(resource)
    root_path
  end
end