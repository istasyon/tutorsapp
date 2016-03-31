class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :day_of_week
      t.string :start_time
      t.string :end_time
      t.string :timezone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
