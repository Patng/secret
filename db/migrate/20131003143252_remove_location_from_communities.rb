class RemoveLocationFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :location, :string
  end
end
