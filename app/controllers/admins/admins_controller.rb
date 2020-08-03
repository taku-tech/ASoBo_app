class Admins::AdminsController < ApplicationController
	before_action :authenticate_admin!

	def show
	end

	def edit
	end

	def update
		current_admin.update(admin_params)
		redirect_to admins_admin_path(current_admin)
	end

	private
		def admin_params
			params.require(:admin).permit(:email)
		end
end
