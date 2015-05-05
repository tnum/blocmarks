class User < ActiveRecord::Base

  has_many :topics, dependent: :destroy
  has_many :bookmarks, through: :topics
  has_many :likes, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
  
end
