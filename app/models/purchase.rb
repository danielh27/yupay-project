class Purchase < ApplicationRecord
  belongs_to :product
  belongs_to :supplier

  validates :stock_received, presence: true, numericality: { only_integer: true, greather_than: 0 }
end
