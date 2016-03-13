class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @student_appointments = @user.appointments
    @teacher_appointments = Appointment.where(listing_id: Listing.where(user_id: current_user.id))
    @listings = @user.listings
    @my_students = User.where(@teacher_appointments.select(:user_id).distinct)
    @my_teachers = User.where(user_id: Listing.where(listing_id: @student_appointments.select(:listing_id).distinct).select(:user_id).distinct)

  end
end
