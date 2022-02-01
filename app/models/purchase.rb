class Purchase < ApplicationRecord
  belongs_to :supplier
  has_many :list_purchases
end
