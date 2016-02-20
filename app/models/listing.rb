class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :appointments
	belongs_to :language
end
