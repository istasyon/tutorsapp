class WelcomeController < ApplicationController

  def home
  	@languages = Language.all
  	@locations = Teacher.uniq.pluck(:location)
  end
  
  def become_a_teacher
  	@user = current_user
  end
  
end
