class Customer < ApplicationRecord
  has_many :orders

  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
end
