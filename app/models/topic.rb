class Topic < ActiveRecord::Base
	has_many :bookmarks
end