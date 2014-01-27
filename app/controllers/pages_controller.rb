class PagesController < ApplicationController
  #landing page / root page / static pages
  def index
    if params[:search] && params[:search][:title]
      title = params[:search][:title]
      @videos = Video.where("title ilike ?", "%#{title}%")
    else
      @videos = Video.all
    end
  end
end
