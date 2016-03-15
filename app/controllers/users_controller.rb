class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @student_appointments = @user.appointments.includes(:listing)
    @teacher_appointments = Appointment.where(listing_id: Listing.where(user_id: current_user.id)).includes(:user)
    @listings = @user.listings.includes(:language)
    @my_students = User.where(id: @teacher_appointments.select(:user_id).distinct)
    @my_teachers = User.where(id: Listing.where(id: @student_appointments.select(:listing_id).distinct).select(:user_id).distinct)

  end
end
