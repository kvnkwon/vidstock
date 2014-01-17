class Video < ActiveRecord::Base
  acts_as_taggable
  belongs_to :user, inverse_of: :videos
  has_many :comments, inverse_of: :video, dependent: :destroy
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :video_link
  validates_numericality_of :user_id, only_integer: :true
  validates :downloads, :numericality => { :greater_than_or_equal_to => 0 }
  validates_numericality_of :downloads, only_integer: :true


  def vimeo_id
    regex = /(?:videos|video|\.com)\/([\d]+)/
    unless video_link == ""
      video_link.match(regex)[1]
    end
  end


  def set_thumbnail!
    self.thumbnail = Vimeo::Simple::Video.info(vimeo_id)[0]["thumbnail_large"]
  end
end
