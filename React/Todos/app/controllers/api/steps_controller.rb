class Api::StepsController < ApplicationController
  def show
    @step = Step.find_by(id: params[:id])
    render json: @step
  end

  def index
    @steps = Step.all
    render json: @steps
  end 

  def create
    @step = Step.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    @step = Step.find_by(id: params[:id])
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def destroy
    @step = Step.find_by(id: params[:id])
    @step.destroy
    render json: @step
  end

  private
  def step_params
    params.require(:step).permit(:title, :body, :done, :todo_id)
  end
end