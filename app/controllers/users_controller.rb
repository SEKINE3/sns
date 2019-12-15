class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
	end

	def follow
		@user = User.find(params[:id])
		@followings = @user.followings
		@followers = @user.followers
	end

	def create
		@post = Post.new(post_params)
		@post.save
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User(params[:id])
		@user.destroy
		redirect_to posts_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :introduction, :profile_image, :back_image)
		end
end
