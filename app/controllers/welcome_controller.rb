class WelcomeController < ApplicationController
  
  before_action :authenticate_user!, only: :become_a_teacher

  def home
  end
  def become_a_teacher
  end
  def search_results
  end
  
end
