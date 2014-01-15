class PagesController < ApplicationController
  #landing page / root page / static pages
  def index
    @search = Video.search(params[:q])
  end
end
