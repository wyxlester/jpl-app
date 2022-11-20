class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :offer_price, :status, presence: true
  validates :status, inclusion: { in: %w[pending accepted rejected] }
end
