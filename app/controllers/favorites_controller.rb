class FavoritesController < ApplicationController

	def create
		@fovorite = current_user.favorites.create(post_id: params[:post_id])
		@post = Post.find(params[:post_id])
		render 'index.js.erb'
	end

	def destroy
		@fovorite = current_user.find_by(post_id: params[:id].to_i).destroy
		render 'index.js.erb'
	end

end
