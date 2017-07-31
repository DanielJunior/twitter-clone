class Tweet < ApplicationRecord
  validates :content, length: { maximum: 140 }
  belongs_to :user

  scope :desc, -> {order(updated_at: :desc)}
end
