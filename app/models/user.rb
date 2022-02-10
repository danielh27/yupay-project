class User < ApplicationRecord
  after_create :assign_warehouse
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :warehouses
  has_many :orders
  has_many :purchases
  has_many :suppliers
  has_many :customers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def assign_warehouse
    warehouse = Warehouse.new(name: "default", user: self)
    warehouse.save
  end
end
