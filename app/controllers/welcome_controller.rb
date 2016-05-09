class WelcomeController < ApplicationController

  def home
  	if user_signed_in?
  		if current_user.type == "Teacher"
  			redirect_to users_dashboard_path
  		else
  			redirect_to search_path
  		end
  	end
  	@languages = Language.all
  	@locations = Teacher.uniq.pluck(:location)
  end

  def beta_landing
  end
  
  def become_a_teacher
  	@user = current_user
  end
  
end
