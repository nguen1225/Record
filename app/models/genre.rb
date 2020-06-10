class Genre < ApplicationRecord
	belongs_to :user
	has_many :events

	validates :name, presence: true, uniqueness: true
end
