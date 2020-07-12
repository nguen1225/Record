class Contact < ApplicationRecord
  belongs_to :user

  validates :email, presence: true
  validates :message, presence: true, length: { maximum: 500 }
end
