class Admins::AdminsController < ApplicationController
	before_action :authenticate_admin!

	def show
		@admin = Admin.find(current_admin.id)
	end

	def edit
		@admin = Admin.find(current_admin.id)
	end

	def update
		admin = Admin.find(current_admin.id)
		admin.update(admin_params)
		redirect_to admins_admin_path(admin.id)
	end

	private
		def admin_params
			params.require(:admin).permit(:email)
		end
end
