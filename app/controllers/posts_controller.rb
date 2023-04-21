class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comment = Comment.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
    @post.comments_counter = 0
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path notice: 'Post created successfully'
    else
      render :new
    end
    return unless @post.errors.any?

    puts @post.errors.full_messages
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    if @post.destroy
      flash[:success] = 'Post deleted successfully.'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Failed to delete post.'
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
