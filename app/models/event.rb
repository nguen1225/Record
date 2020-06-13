class Event < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :graph

	validates :title, presence: true

	enum alarm: { on: true, off: false }
	validates :alarm, inclusion: { in: ["on", "off"] }
end
