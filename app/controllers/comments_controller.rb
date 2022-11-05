class CommentsController < ApplicationController
  def new
    @id = current_user.id
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:id])
    comment = Comment.new(author: current_user, post: post, text: comments_params[:text])
    if comment.save
      flash[:notice] = 'Comment created successfully'
    else
      flash[:error] = 'Error'
    end
    redirect_to user_post_comments_path
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
