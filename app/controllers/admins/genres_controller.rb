class Admins::GenresController < ApplicationController
	before_action :authenticate_admin!

	def index
		@genres = current_admin.genres.all
		@genre = current_admin.genres.new
	end

	def create
		genre = current_admin.genres.new(genre_params)
		genre.save
		redirect_to admins_genres_path
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		genre = Genre.find(params[:id])
		genre.update(genre_params)
		redirect_to admins_genres_path
	end

	private
		def genre_params
			params.require(:genre).permit(:name, :is_valid)
		end
end
