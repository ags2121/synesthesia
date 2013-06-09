class Like < ActiveRecord::Base
  attr_accessible :user_id, :sound_id
  belongs_to :sound

	def self.image_for_like_state(user_id, sound_id)
		if Like.where(:user_id => user_id, :sound_id => sound_id).present?
			return 'thumbs-up.jpg'
		else
			'thumbs-up-disabled.jpg'
		end
	end

	def self.like_exists?(user_id, sound_id)
		Like.where(:user_id => user_id, :sound_id => sound_id).present?
	end

	def self.like_for(user_id, sound_id)
		res = Like.where(:user_id => user_id, :sound_id => sound_id)[0]
		if res
			return res
		else
			nil
		end
	end
end
