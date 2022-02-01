class Product < ApplicationRecord
  belongs_to :warehouse
  has_many :orders
  has_many :purchases
  CATEGORY = %w[Polos Jeans Shorts Camisas Chompas Vestidos Faldas Blusas Casacas Abrigos Trajes Bufandas Pijamas Bodies Fajas]
  SIZE = %w[XS S M L XL]

  validates :name, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: CATEGORY,  message: "%{value} categoria invalida" }
  validates :size, presence: true, inclusion: { in: SIZE, message: "%{value} es una talla invalida" }
  validates :price, presence: true, numericality: { greather_than: 0 }
  validates :cost, presence: true, numericality: { greather_than: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
  validates :minimum_required, presence: true, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
end
