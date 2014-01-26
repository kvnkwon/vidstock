class Comment < ActiveRecord::Base
  belongs_to :video, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
  validates_presence_of :content
  validates_numericality_of :video_id, only_integer: :true
end
