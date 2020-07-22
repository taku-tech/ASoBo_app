class Users::ResultsController < ApplicationController
	def show
		result = current_user.results.find(params[:id])
		@result_words = result.result_words.all
	end
end
