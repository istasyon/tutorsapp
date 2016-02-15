class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps null: false
    end
    add_index :lessons, :student_id
    add_index :lessons, :teacher_id
  end
end
