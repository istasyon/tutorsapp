class Appointment < ActiveRecord::Base
	has_one :review
	belongs_to :listing
	belongs_to :user
end
