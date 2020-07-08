class Admins::WordsController < ApplicationController
	def index
		@words = current_admin.words.all
	end

	def new
		@word = current_admin.words.new
		@genres = current_admin.genres.where(is_valid: true)
	end

	def create
		word = current_admin.words.new(word_params)
		word.genre_id = params[:word][:genre_id]
		word.save
		redirect_to admins_words_path
	end

	def edit
		@word = Word.find(params[:id])
		@genres = current_admin.genres.where(is_valid: true)
	end

	def update
		word = Word.find(params[:id])
		word.update(word_params)
		redirect_to admins_words_path
	end

	def destroy
		word = Word.find(params[:id])
		word.destroy
		redirect_to admins_words_path
	end

	private

		def word_params
			params.require(:word).permit(:word, :word_jp,:image)
		end
end
