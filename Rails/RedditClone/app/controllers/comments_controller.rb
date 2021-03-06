class CommentsController < ApplicationController 
  before_action :require_logged_in

  def show
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post
    render :show
  end

  def new
    @post = Post.find(params[:post_id])    
    render :new
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post.id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def upvote
    @comment = Comment.find_by(id: params[:id])
    @comment.vote(1)
    redirect_back(fallback_location: '/')
  end

  def downvote
    @comment = Comment.find_by(id: params[:id])
    @comment.vote(-1)
    redirect_back(fallback_location: '/')
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_comment_id)
  end
end