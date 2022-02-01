class TracksController < ApplicationController
  before_action :require_logged_in!, except: :show

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @albums = Album.find_by(id: params[:album_id]).band.albums
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    @track.band_id = @track.album.band.id
    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_album_track_url(@track.album_id)
    end
  end

  def edit 
    @track = Track.find_by(id: params[:id])
    @albums = @track.band.albums
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    @track.band_id = @track.album.band.id
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    redirect_to album_url(@track.album_id)
  end

  private
  def track_params
    params.require(:tracks).permit(:title, :ord, :bonus, :lyrics, :band_id, :album_id)
  end
end