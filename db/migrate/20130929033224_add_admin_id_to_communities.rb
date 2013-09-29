class AddAdminIdToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :admin_id, :integer
  end
end
