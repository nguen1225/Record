class Event < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :graph
end
