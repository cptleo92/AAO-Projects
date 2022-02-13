class PostsController < ApplicationController
  before_action :require_logged_in, except: [:show]
  before_action :only_authors, only: [:edit, :update, :destroy]
  before_action :at_least_one_sub, only: [:create, :update]

  def show    
    @post = Post.find_by(id: params[:id])
    @all_comments = @post.comments.includes(:author)
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
    @post = current_user.posts.new(post_params)       
    # @post.sub_ids = params[:post][:sub_ids]
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
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to '/'
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :url, :author_id, sub_ids: [])
  end

  def only_authors
    post = Post.find(params[:id])
    unless post.author == current_user
      render plain: 'nope!', status: :forbidden
    end
  end

  def at_least_one_sub
    if params[:post][:sub_ids] == [""]
      flash.now[:error] = "Must choose at least 1 sub!"       
    end
  end
  
end