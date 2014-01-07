class CommentsController < ApplicationController

  def create
    @video = Video.find(params[:video_id])
    @comment = Comment.new(comment_params)
    @comment.video = @video
    if @comment.save
    else
      flash[:error] = "Error! Comment not saved."
    end
    redirect_to video_path(@video)
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :video_id)
  end

end