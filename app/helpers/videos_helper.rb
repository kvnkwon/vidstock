module VideosHelper
  def tag_links_for(video)
    links = video.tags[0, 5].map do |t|
      link_to t.name, tag_path(t.name)
    end

    if video.tags.count > 5
      (links.join(', ') + "...").html_safe
    else
      (links.join(', ')).html_safe
    end
  end
end
