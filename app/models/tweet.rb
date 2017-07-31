class Tweet < ApplicationRecord
  belongs_to :user

  scope :desc, -> {order(updated_at: :desc)}
end
