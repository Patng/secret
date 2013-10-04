class AddLocationIdToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :location_id, :integer
  end
end
