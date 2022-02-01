class ListOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greather_than: 0 }
end
