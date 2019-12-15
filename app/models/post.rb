class Post < ApplicationRecord

	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :favorite, dependent: :destroy

	mount_uploader :post_image, PostImageUploader
	mount_uploader :post_video, PostVideoUploader

	validates :body, presence: true, length: { maximum: 50 }

	def favorite?(post, user)
		post.favorites.find_by(user_id: user.id)
	end

	def create_notification_by(current_user)
		notification = current_user.active_notifications.new(
			post_id:self.id,
			sender_id:self.contributer.id,
			action:"comment"
			)

			notification.save if notification.valid?
	end

	def create_notification_by(current_user)
		notification = current_user.active_notifications.new(
			post_id:self.id,
			sender_id:self.contributer.id,
			action:"follow"
			)

			notification.save if notification.valid?
	end
end
