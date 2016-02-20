class RemoveFieldFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :commenter_id, :integer
  end
end
