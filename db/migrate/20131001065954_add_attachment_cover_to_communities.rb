class AddAttachmentCoverToCommunities < ActiveRecord::Migration
  def self.up
    change_table :communities do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :communities, :cover
  end
end
