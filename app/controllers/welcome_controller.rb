class WelcomeController < ApplicationController
  def home
  end
  def become_a_teacher
  	if !user_signed_in?
		redirect_to new_user_session_path
    else
    	render "become_a_teacher"
    end
  end
  def search_results
  end
  
end
