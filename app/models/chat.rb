class Chat < ApplicationRecord
  varidates :comment, presence: true
  belongs_to :user
  belongs_to :room
end
