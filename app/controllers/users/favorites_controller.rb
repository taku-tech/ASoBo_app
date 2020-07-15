class Users::FavoritesController < ApplicationController
	def index
		@favorites = current_user.favorites.all
	end

	def create
		word = Word.find(params[:word_id])
		favorite = current_user.favorites.new(word_id: word.id)
		favorite.save
		redirect_to words_path
	end

	def destroy
		word = Word.find(params[:word_id])
		favorite = current_user.favorites.find_by(word_id: word.id)
		favorite.destroy
		redirect_to words_path
	end
end
