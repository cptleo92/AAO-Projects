class Api::PokemonController < ApplicationController
  def index 
    sleep 0.5
    @pokemon = Pokemon.all 
    render :index 
  end


  def show 
    sleep 0.5
    @pokemon = Pokemon.find(params[:id])
    render :show
  end

  def create
    @pokemon = Pokemon.new(poke_params)
    if @pokemon.save
      redirect_to api_pokemon_url(@pokemon.id)
    else
      render json: @pokemon.errors.full_messages, status: 422
    end
  end

  private
  def poke_params
    params.require(:pokemon).permit(:id, :name, :attack, :defense, :image_url, :poke_type)
  end
end
