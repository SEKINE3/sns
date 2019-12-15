class CommentsController < ApplicationController

	def create
    comment=current_user.active_comment.new(post_id:params[:post_id])
    like.save
    @post = Post.find(params[:post_id])
    @post.create_notification_by(current_user)
    respond_to do |format|
      format.html {redirect_to request.referrer}
      format.js
    end
end
