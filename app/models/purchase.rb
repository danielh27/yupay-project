class Purchase < ApplicationRecord
  belongs_to :supplier
  belongs_to :user
  has_many :list_purchases, dependent: :destroy

  validates :supplier, presence: true
end
