class RemoveCategoryFromCommunities < ActiveRecord::Migration
  def change
    remove_column :communities, :category, :string
  end
end
