class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	protected

	def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_main_path
    else
      level_path
    end
  end

	#sign_out後のredirect先変更する。
	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :user
			root_path
		elsif resource_or_scope == :admin
			admins_root_path
		else
			root_path
		end
	end
end
