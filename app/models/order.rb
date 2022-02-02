class Order < ApplicationRecord
  belongs_to :customer
  has_many :list_orders
end
