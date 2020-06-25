class Notification < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :event, optional: true

	default_scope->{order(created_at: :desc)}
end
