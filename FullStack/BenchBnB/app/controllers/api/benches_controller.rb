class Api::BenchesController < ApplicationController

  # GET /benches or /benches.json
  def index
    # byebug
    @benches = Bench.in_bounds(params[:bounds])
    if (params[:minSeating])
      @benches = @benches.where('seating >= ?', params[:minSeating])
    end

    if (params[:maxSeating])
      @benches = @benches.where('seating <= ?', params[:maxSeating])
    end    
  end

  def new
  end

  def show
    @bench = Bench.find(params[:id])
  end

  def create   
    @bench = Bench.new(bench_params)
    if @bench.save     
      redirect_to api_bench_url(@bench)
    else
      render json: @bench.errors, status: :unprocessable_entity
    end    
  end 

  private
  def bench_params
    params.require(:bench).permit(:description, :seating, :lat, :lng)
  end
end
