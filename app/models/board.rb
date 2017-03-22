class Board < ApplicationRecord
  belongs_to :user
  has_many :interests
  validates_presence_of :description
  validates_uniqueness_of :title
end
