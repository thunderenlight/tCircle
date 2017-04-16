class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :boards
  has_many :interests
  has_many :comments


  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                                      :default_url => "default-thumbnail.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
# has_attached_file :download,
#                     :storage => :s3,
#                     :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

#   def s3_credentials
#     {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
#   end