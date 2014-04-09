class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been uploaded successfully."
      redirect_to comments_path
    else
      flash[:alert] = "Your comment failed to save. Please try again."
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been deleted."
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user)
  end
end
