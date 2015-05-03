class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_one :user, through: :topic
end
