class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @id = current_user.id
    @post = Post.new
  end

  def create
    post = Post.new(title: post_params[:title], text: post_params[:text], user: current_user)
    flash[:notice] = if post.save
                       'Post created successfully'
                     else
                       'Error'
                     end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
