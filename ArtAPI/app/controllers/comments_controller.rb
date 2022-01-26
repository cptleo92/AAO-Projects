class CommentsController < ApplicationController
  def index
    user_id = params[:user_id]
    artwork_id = params[:artwork_id]
    if user_id
      render json: User.find(user_id).comments
    elsif artwork_id
      render json: Artwork.find(artwork_id).comments
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_message, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end