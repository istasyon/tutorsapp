class AddFieldToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :appointment, index: true, foreign_key: true
  end
end
