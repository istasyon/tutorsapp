class ReviewsController < ApplicationController
	def create
		# Refactor if better possible
		# @review = Appointment.find(params[:appointment_id]).review.create(review_params)
		@review = Review.create(review_params, user_id: Appointment.find(params[:appointment_id]).listing.user.id )
		#add redirect_to OR is it ajax?
	end

	def destroy
      @review = Appointment.find(params[:appointment_id]).review
      @review.destroy
      #add redirect_to OR is it ajax?
	end	

	private
	def review_params
		params.require(:review).permit(:comment, :star, :appointment_id)
	end
end
