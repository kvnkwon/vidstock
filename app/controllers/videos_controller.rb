class VideosController < ApplicationController

  before_filter :authenticate_user!, except: [:show]
  before_filter :authenticate_owner, only: [:edit, :destroy, :update]
  def index
    @search = Video.search(params[:q])
    
    if params[:q]
      tagged = params[:q][:title_cont]
      @videos = Video.tagged_with(tagged, wild: true, any: true)
    elsif params[:tag]
      @videos = Video.tagged_with(params[:tag], wild: true, any: true)
    else
      @videos = Video.all
    end

    @videos = @videos.page(params[:page]).per_page(5)
  end

  def new
    @video = Video.new
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      flash[:notice] = 'Video was updated successfully!'
      redirect_to video_path(@video)  
    else
      flash[:error] = 'Error! Could not update video!'
      render :new
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    respond_to do |format|
      format.html { redirect_to user_videos_path }
    end
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    @video.set_thumbnail!

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

  def authenticate_owner
    unless Video.find(params[:id]).user == current_user
      redirect_to videos_path, notice: "Unable to authenticate!"
    end
  end

  def video_params
    params.require(:video).permit(:title, :description, :downloads, :user_id, :tag_list, :video_link)
  end

end