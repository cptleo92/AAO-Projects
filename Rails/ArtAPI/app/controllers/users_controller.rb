class UsersController < ApplicationController
  def index
    name = params[:query]
    if name
      render json: User.where('username LIKE ?', "%#{name}%")
    else      
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def updateq
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])    
    user.destroy
    render json: user  
  end

  def favorite
    id = params[:id]
    favs = Artwork.where('favorite = true AND artist_id = ?', id)
    fav_shares = ArtworkShare.where('favorite = true AND viewer_id = ?', id)
    render json: (favs + fav_shares)
  end  

  private
  def user_params
    params.require(:user).permit(:username)
  end
end