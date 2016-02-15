class AddListingRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :listing, index: true, foreign_key: true
  end
end
