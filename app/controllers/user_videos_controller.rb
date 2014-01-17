class UserVideosController < ApplicationController

  def index
    @videos = current_user.videos
  end
end