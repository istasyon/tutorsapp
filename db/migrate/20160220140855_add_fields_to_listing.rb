class AddFieldsToListing < ActiveRecord::Migration
  def change
    add_reference :listings, :language, index: true, foreign_key: true
  end
end
