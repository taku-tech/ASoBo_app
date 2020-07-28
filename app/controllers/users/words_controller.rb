class Users::WordsController < ApplicationController
	before_action :authenticate_user!

	def index
		@words = Word.all
	end
end
