class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been uploaded successfully."
      redirect_to posts_path
    else
      flash[:alert] = "Your post failed to save. Please try again."
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been deleted."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :user)
  end
end
