class ArtworksController < ApplicationController
  def index
    artist = User.find(params[:user_id])
    all_arts = artist.artworks + artist.shared_artworks
    render json: all_arts
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def create
    art = Artwork.new(artwork_params)
    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    art = Artwork.find(params[:id])
    if art.update_attributes(artwork_params)
      render json: art
    else
      render json: art.errors, status: :unprocessable_entity
    end
  end

  def destroy
    art = Artwork.find(params[:id])
    art.destroy
    render json: art
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end