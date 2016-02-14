class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :phone, :string
    add_column :users, :from, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :skype, :string
    add_column :users, :location, :string
    add_column :users, :is_trail, :string
    add_column :users, :description, :text
    add_column :users, :video_url, :string
    add_column :users, :price, :integer
    add_column :users, :platform, :string
    add_column :users, :time_zone, :string
  end
end
