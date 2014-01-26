class UserVideosController < ApplicationController

  def index
    @videos = current_user.videos
    @videos = @videos.page(params[:page]).per_page(5)
  end
end