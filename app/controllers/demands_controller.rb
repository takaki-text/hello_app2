class DemandsController < ApplicationController
  
  before_action :authenticate_user!
  def new
    @demand = Demand.new
  end
  def index
    @demands = Demand.all
    
  end
  

  def show
    @demand = Demand.find(params[:id])
    @demands = @demand.user.demands
    @user = @demand.user
  end
  
  def create
    @demand = Demand.new(demand_params)
    @demand.user_id = current_user.id
    @demand.save
    redirect_to demands_path
  end

  def edit
    @demand = Demand.find_by(id:params[:id])
  end

  def update
    @demand = Demand.find_by(id: params[:id])
    @demand.update(body: params[:body])
    redirect_to("/")
  end

  def destroy
    @demand = Demand.find_by(id: params[:id])
    @demand.destroy
    redirect_to("/")
  end
  private
  def demand_params
    params.require(:demand).permit(:body)# tweetモデルのカラムのみを許可
  end
  def after_demands_new_path_for(resource)
    root_path
  end
end
