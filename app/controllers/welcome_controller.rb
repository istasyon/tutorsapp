class WelcomeController < ApplicationController
  
  before_action :authenticate_user!, only: :become_a_teacher

  def home
  	@languages = Language.all
  	@locations = User.uniq.pluck(:location)
  end
  def become_a_teacher
  	@user = current_user
  end
  def search_results
  end
  
end
