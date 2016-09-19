class Chatroompost < ApplicationRecord
	belongs_to :chatroom

	def self.find_post_author_img(post)
		User.find_by_username(post.author).image_url(:thumb)
	end
end
