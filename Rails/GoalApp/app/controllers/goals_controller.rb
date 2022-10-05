class GoalsController < ApplicationController
  before_action :require_logged_in, except: :show
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end 
  end

  def edit        
    @goal = Goal.find_by(id: params[:id])
  end

  def update
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      render :edit
    end
  end

  def destroy

  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  private
  def goal_params
    params.require(:goal).permit(:description, :public?)
  end
end
