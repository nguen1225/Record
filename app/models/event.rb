class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :graph
  has_many :notifications

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true

  enum alarm: { on: true, off: false }
  validates :alarm, inclusion: { in: %w[on off] }
end
