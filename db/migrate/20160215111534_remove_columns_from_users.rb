class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_trail, :string
    remove_column :users, :description, :text
    remove_column :users, :video_url, :string
    remove_column :users, :price, :integer
    remove_column :users, :platform, :string
  end
end
