class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :item_name, :offer_price, presence: true
end
