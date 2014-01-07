class Video < ActiveRecord::Base
  has_many :comments, inverse_of: :video, dependent: :destroy
  validates_presence_of :title
  validates_presence_of :description
  validates :downloads, :numericality => { :greater_than_or_equal_to => 0 }
  validates_numericality_of :downloads, only_integer: :true
end
