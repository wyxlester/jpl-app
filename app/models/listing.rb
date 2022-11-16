class Listing < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :photo

  validates :item_name, :item_description, :price, presence: true
  validates :item_name, uniqueness: true
end
