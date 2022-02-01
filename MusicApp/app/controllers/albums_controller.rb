class AlbumsController < ApplicationController
  before_action :require_logged_in!, except: :show
  
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new    
    @bands = Band.all
    @album = Album.new(band_id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(@album.band_id)
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @album.destroy
    redirect_to band_url(@album.band_id)
  end

  private 
  def album_params
    params.require(:albums).permit(:title, :year, :studio, :band_id)
  end
end