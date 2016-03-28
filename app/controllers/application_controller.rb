class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    #just sampe we didn't need devicse gem we can use static user
	def after_sign_in_path_for
	  node_rails_devise_redis_sync(User.first)
	end

    #just sampe we didn't need devicse gem we can use static user
	def after_sign_out_path
      node_rails_devise_redis_clean
	end
end
