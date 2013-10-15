class AddIntroToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :intro, :string
  end
end
