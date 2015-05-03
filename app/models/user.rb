class User < ActiveRecord::Base

  has_many :topics, dependent: :destroy
  has_many :bookmarks, through: :topics
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
end
