class Video < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user, inverse_of: :videos
  has_many :comments, inverse_of: :video, dependent: :destroy
  validates_presence_of :title
  validates_presence_of :description
  validates_numericality_of :user_id, only_integer: :true
  validates :downloads, :numericality => { :greater_than_or_equal_to => 0 }
  validates_numericality_of :downloads, only_integer: :true
end
