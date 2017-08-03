class Tweet < ApplicationRecord
  validates :content, length: { maximum: 140 }
  validates_presence_of :content
  validates_presence_of :user

  belongs_to :user

  scope :desc, -> {order(updated_at: :desc)}
end
