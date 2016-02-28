class AddFieldsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :starts_at, :datetime
    add_column :appointments, :ends_at, :datetime
  end
end
