class ListingsController < ApplicationController
  before_action :get_user, only: [:new, :create]

	def welcome_search
    @results = Listing.where(language_id: params[:language_id], 
      user_id: User.where(location: params[:location])).includes(user: [:reviews]).paginate(:page => params[:page], :per_page => 10)
	end

  def index
  	@listings = Listing.all
  end

  def nearby
    if params[:search].present?
      @results = Listing.where(user_id: Teacher.near(params[:search]).map do |t| t.id end).includes(user: [:reviews]).paginate(:page => params[:page], :per_page => 10)
      @languages = Language.all
      @locations = Teacher.uniq.pluck(:location)
      @hash = Gmaps4rails.build_markers(@results) do |listing, marker|
        marker.lat listing.user.latitude
        marker.lng listing.user.longitude
      end
      render 'search'
    else
      @results = Listing.all.includes(user: [:reviews]).paginate(:page => params[:page], :per_page => 10)
      @hash = Gmaps4rails.build_markers(@results) do |listing, marker|
        marker.lat listing.user.latitude
        marker.lng listing.user.longitude
      end     
      @languages = Language.all
      @locations = Teacher.uniq.pluck(:location)
      render 'search'
    end
  end

  def search
    # Add Complex Filtering based on
    # from, location,
    # language_id, price, platform, is_trial

  	#Refactor for one query
  	@results = welcome_search
    @languages = Language.all
    @locations = Teacher.uniq.pluck(:location)
    @hash = Gmaps4rails.build_markers(@results) do |listing, marker|
      marker.lat listing.user.latitude
      marker.lng listing.user.longitude
    end
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
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
    @languages = Language.all.collect { |l| [l.name, l.id] }
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to users_dashboard_path
    else
      render 'edit'
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @appointment = @listing.appointments.new
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
