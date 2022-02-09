class Supplier < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 6 }, uniqueness: true
end
