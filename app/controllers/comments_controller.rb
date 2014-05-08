class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    # @post = Post.find(params[:id])
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "New comment created."
      redirect_to post_path(@comment.post_id)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

private

  def comment_params
    params.require(:comment).permit(:date, :body, :post_id, :name, :user_id)
  end
end