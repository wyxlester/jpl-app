class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :offer_price, presence: true
end
