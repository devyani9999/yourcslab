class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    users_root_path(resource.id)
  end
end
