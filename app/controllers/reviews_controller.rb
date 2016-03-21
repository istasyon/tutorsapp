class ReviewsController < ApplicationController
	def create
		# Refactor if better possible
		# @review = Appointment.find(params[:appointment_id]).review.create(review_params)
		@review = Appointment.find(params[:appointment_id]).create_review(review_params)
		redirect_to users_dashboard_path
		#add redirect_to OR is it ajax?
	end

	def destroy
      @review = Appointment.find(params[:appointment_id]).review
      @review.destroy
      #add redirect_to OR is it ajax?
	end	

	private
	def review_params
		params.require(:review).permit(:comment, :star, :user_id)
	end
end
