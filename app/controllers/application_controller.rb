class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)
		  admins_users_path
		elsif current_user
	      flash[:notice] = ""
	      user_path(resource)  #　指定したいパスに変更
	    else
		  flash[:notice] = ""
	      user_path  #　指定したいパスに変更
		end
	end

	def after_sign_out_path_for(resource)
	    if resource == :admin
	      new_admin_session_path
	    else
	      root_path
	    end
	end

	def routing_error
	  render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
	end


	def configure_permitted_parameters
	  added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :nick_name, :goal, :email,:encrypted_password]
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs

    end
end