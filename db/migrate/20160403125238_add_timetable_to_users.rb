class AddTimetableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timetable, :text
  end
end
