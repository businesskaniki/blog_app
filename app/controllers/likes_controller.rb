class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])

    @like = Like.new(
      author_id: current_user.id,
      post_id: @post.id
    )

    if @like.save
      redirect_to user_posts_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
