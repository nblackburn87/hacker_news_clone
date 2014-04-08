class CommentsController < ApplicationController

  def new
    @comment_found = Comment.find(params[:id])
    @comment = Comment.new(:commentable_id => @comment_found.id, :commentable_type => "Post")
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been uploaded successfully."
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = "Your comment failed to save. Please try again."
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been edited successfully."
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = "Your comment did not update. Please try again."
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been deleted."
    redirect_to post_path(@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user, :commentable_id, :commentable_type)
  end
end
