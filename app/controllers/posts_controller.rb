class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by(id: params[:id])

    return unless @post.nil?

    redirect_to user_posts_path(@user)
  end
end
