class ApplicationController < ActionController::Base
	
	private

	  def authenticate_user
	    unless current_user
	      flash[:danger] = "Inscrit toi ;-) "
	      redirect_to new_session_path
	    end
	  end


    def authenticate_admin
      if current_user != nil && current_user.is_admin == true
          return true
      # elsif current_user != nil && current_user.is_admin == false
      #   return false
      else
        flash[:danger] = "Si t'es admin, connecte toi avec le bon compte..."
        redirect_to root_path
      end
    end

end
