class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :list_orders, dependent: :destroy
end
