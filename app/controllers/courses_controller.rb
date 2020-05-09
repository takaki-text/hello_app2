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
    @course.update(tag_list: params[:tag_list])
    redirect_to("/")
  end

  def destroy
    @course = Course.find_by(id: params[:id])
    @course.destroy
    redirect_to("/")
  end
  
  

  
  private

  def course_params
    params.require(:course).permit(:plan, :title, :tag_list,)
  end
  def after_courses_new_path_for(resource)
    root_path
  end
end