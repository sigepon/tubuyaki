class PostsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:body, :picture).merge(user_id: current_user.id)
  end
end
