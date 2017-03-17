class Comment < ApplicationRecord
  belongs_to :interest
  belongs_to :user
end
