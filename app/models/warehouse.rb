class Warehouse < ApplicationRecord
  belongs_to :user
  has_many :products

  validates :name, presence: true
end
