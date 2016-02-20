class AddFiledsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :commenter_id, :integer
  end
end
