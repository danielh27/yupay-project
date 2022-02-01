class ListPurchase < ApplicationRecord
  belongs_to :product
  belongs_to :purchase

  validates :quantity, presence: true, numericality: { only_integer: true, greather_than: 0 }
end
