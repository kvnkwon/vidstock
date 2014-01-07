class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = 'Video was successfully uploaded!'
      redirect_to video_path(@video)  
    else
      flash[:error] = 'Error! Could not upload video!'
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
    @comment = Comment.new
    @comments = @video.comments
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :downloads)
  end

end