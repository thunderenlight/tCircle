class AddAttachmentImageToInterests < ActiveRecord::Migration
  def self.up
    change_table :interests do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :interests, :image
  end
end
