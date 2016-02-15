class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :description
      t.string :video_url
      t.integer :price
      t.boolean :is_trial
      t.string :platform

      t.timestamps null: false
    end
  end
end
