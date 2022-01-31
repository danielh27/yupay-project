class Supplier < ApplicationRecord
  has_many :purchases

  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
end
