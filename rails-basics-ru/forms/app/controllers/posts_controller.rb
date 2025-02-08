class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path
    else
      redirect_to post_path(@post)
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end

end
