class ListingsController < ApplicationController
  before_action :get_user, only: [:new, :create]

	def welcome_search
    @results = Listing.where(language_id: params[:language_id], 
      user_id: User.where(location: params[:location])).includes(:user).paginate(:page => params[:page], :per_page => 10)
	end

  def index
  	@listings = Listing.all
  end

  def search
  	#Refactor for one query
  	@results = welcome_search
    @languages = Language.all
    @locations = Teacher.uniq.pluck(:location)
  	# Add Filtering based on
  	# from, location,
  	# language_id, price, platform, is_trial
  end

  def new
    @listing = @user.listings.new
    @languages = Language.all.collect { |l| [l.name, l.id] }
  end

  def create
    @listing = @user.listings.new(listing_params)

    if @listing.save
      redirect_to users_dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @listing = Listing.find(params[:id])
    @user = @listing.user
  end

    private

    def get_user
      @user = User.find(params[:user_id])
    end

    def listing_params
      params.require(:listing).permit(:description, :is_trial, :price, :video_url, :platform, :language_id)
    end

end
