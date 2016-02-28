class AppointmentsController < ApplicationController
	before_action :get_listing
  def new
  	@appointment = @listing.appointments.new
  end

  def create
  	@appointment = @listing.appointments.new(appointment_params)
  	if @appointment.save
  		redirect_to :root
  	else
  		render :new
  	end
  end


  def edit
  end

  private

  def get_listing
    @listing = Listing.find(params[:listing_id])
  end

  def appointment_params
  	params.require(:appointment).permit(:starts_at, :ends_at, :listing_id, :user_id)
  end


end
