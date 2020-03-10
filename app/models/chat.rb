class Chat < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :room
end
