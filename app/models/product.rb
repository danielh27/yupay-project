class Product < ApplicationRecord
  belongs_to :warehouse
  has_many :list_orders
  has_many :list_purchases
  has_many :orders, through: :list_orders
  has_many :purchases, through: :list_purchases
  # cloudinary:
  has_one_attached :photo
  before_save :set_bar_code
  CATEGORY = %w[Polos Jeans Shorts Camisas Chompas Vestidos Faldas Blusas Casacas Abrigos Trajes Bufandas Pijamas Bodies Fajas]
  SIZE = %w[XS S M L XL]

  validates :name, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: CATEGORY,  message: "%{value} categoria invalida" }
  validates :size, presence: true, inclusion: { in: SIZE, message: "%{value} es una talla invalida" }
  validates :price, presence: true, numericality: { greather_than: 0 }
  validates :cost, presence: true, numericality: { greather_than: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greather_than_or_equal_to: 0 }
  validates :minimum_required, presence: true, numericality: { only_integer: true, greather_than_or_equal_to: 0 }

  private

  def set_bar_code
    self.bar_code = generate_bar_code
  end

  def generate_bar_code
    loop do
      length = 8
      bar_code = SecureRandom.random_number(9 * (10**(length - 1))) + (10**(length-1)).to_i
      break bar_code unless Product.where(bar_code: bar_code).exists?
    end
  end
end
