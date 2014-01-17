class AddThumbnailToVideos < ActiveRecord::Migration
  def up
    add_column :videos, :thumbnail, :string
  end

  def down
    remove_column :videos, :thumbnail
  end
end
