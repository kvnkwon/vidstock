class AddVideoLinkToVideo < ActiveRecord::Migration
  def up
    add_column :videos, :video_link, :string, null: false
  end

  def down
    remove_column :videos, :video_link
  end
end
