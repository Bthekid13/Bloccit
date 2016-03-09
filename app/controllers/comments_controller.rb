class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    commentable = Post.find(params[:post_id]) || Topic.find(params[:topic_id])
    comment = Comment.new comment_params
    comment.assign_attributes(commentable: commentable, user: current_user)

    if comment.save
      flash[:notice] = "Comment saved successfully"
      redirect_to :back
    else
      flash[:alert] = "Comment failed to save"
      redirect_to :back
    end
  end

  def destroy
    commentable = Post.find(params[:post_id]) || Topic.find(params[:topic_id])
    comment = commentable.find params[:id]

    if comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to :back
    else
      flash[:alert] = "Comment couldn't be deleted. Please try again."
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You don't have permission to delete that comment"
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
