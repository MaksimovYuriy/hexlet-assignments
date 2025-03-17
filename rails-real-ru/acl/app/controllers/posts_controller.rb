# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update edit destroy]
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
    authorize @posts
  end

  def new
    raise Pundit::NotAuthorizedError unless current_user
  
    @post = current_user.posts.build
    authorize @post
  end
  

  def create
    raise Pundit::NotAuthorizedError unless current_user
  
    @post = current_user.posts.build(post_params)
    authorize @post
  
    if @post.save
      redirect_to @post
    else
      redirect_to posts_path
    end
  end
  

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to new_session_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post 
  end
  # END
end
