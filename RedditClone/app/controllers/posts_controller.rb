class PostsController < ApplicationController
  before_action :require_logged_in, except: [:show]
  before_action :only_authors, only: [:edit, :update, :destroy]

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      redirect_to subs_url
    else
      render :show
    end
  end

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end  

  def edit
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :url, :sub_id, :author_id)
  end

  def only_authors
    unless params[:post][:author_id] == current_user.id
      render plain: 'nope!', status: :forbidden
    end
  end
  
end