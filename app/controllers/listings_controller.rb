class ListingsController < ApplicationController
  
	def welcome_search
		@teachers = Teacher.where(location: params[:location])
		@results = []
    @teachers.each do |t|
			@results << t.listings.where(language_id: params[:language_id])
		end
	end

  def index
  	@listings = Listing.all
  end

  def search
  	#Refactor for one query
  	@results = welcome_search

  	# Add Filtering based on
  	# from, location,
  	# language_id, price, platform, is_trial
  end

  def new
  end

  def edit
  end

  def show
  end
end
