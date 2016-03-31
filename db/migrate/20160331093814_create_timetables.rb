class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.references :user, index: true, foreign_key: true
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.string :sunday
      t.string :timezone

      t.timestamps null: false
    end
  end
end
