class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :videos, inverse_of: :user, dependent: :destroy
  validates_presence_of :username

  def admin?
    role == 'admin'
  end
end
