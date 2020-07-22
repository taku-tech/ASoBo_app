class Users::ResultsController < ApplicationController
	def index
		@results = current_user.results.all
	end

	def show
		result = current_user.results.find(params[:id])
		@result_words = result.result_words.all
	end
end
