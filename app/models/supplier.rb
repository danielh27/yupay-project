class Supplier < ApplicationRecord

  validates :name, presence: true, length: { minimum: 6 }, uniqueness: true
end
