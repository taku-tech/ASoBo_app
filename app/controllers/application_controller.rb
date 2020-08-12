class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_admin_path(current_admin)
    else
      level_path
    end
  end

  #sign_out後のredirect先変更する。
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  Refile.secret_key = '9965eb0ced03aae4584924c8af339f5521d5bd5a8e7e68f158b12b57ea6a0dc8f2cd99f49dd9f4140b4005b4345e57f1da38d037b9c045d40ef3b61179d8418b'
end
