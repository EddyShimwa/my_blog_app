class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'comment created successfully'
    else
      @post = Post.find(params[:post_id])
      redirect_to user_post_path(@post.author, @post), notice: 'comment created successfully'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authoroze! :destroy, @comment
    if @comment.destroy
      flash[:success] = 'Comment was successfully deleted.'
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      flash[:error] = 'Failed to delete comment.'
      redirect_to @comment.post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, author_id)
  end
end
