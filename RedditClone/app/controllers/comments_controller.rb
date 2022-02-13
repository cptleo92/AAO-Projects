class CommentsController < ApplicationController
  before_action :require_logged_in

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

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end