class User < ApplicationRecord
  after_create :assign_warehouse
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :warehouses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_warehouse
    warehouse = Warehouse.new(name: "default", user: self)
    warehouse.save
  end
end
