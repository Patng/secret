class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :description
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
