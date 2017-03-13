class Interest < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates_presence_of :description, :image, :board_id
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, 
  									:default_url => "default.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
