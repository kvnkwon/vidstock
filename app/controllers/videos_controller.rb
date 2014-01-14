class VideosController < ApplicationController

  before_filter :authenticate_user!, except: [:show]
  def index
    if params[:tag]
      @videos = Video.tagged_with(params[:tag])
    else
      @videos = Video.all
    end
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    
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
    params.require(:video).permit(:title, :description, :downloads, :user_id, :tag_list)
  end

end