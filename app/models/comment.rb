class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :comment, nill: false
end
