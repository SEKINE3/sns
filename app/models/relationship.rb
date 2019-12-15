class Relationship < ApplicationRecord

	belongs_to :following, class_name: "User"
	belongs_to :followed, class_name: "User"
	#class_nameで"User"モデルをfollowingとfollowedの二つに分ける

	validates :following_id, presence: true
	validates :followed_id, presence: true
	#_idが空でないことを確認
end
