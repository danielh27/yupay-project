require 'faker'

# categories = %w[Polos Jeans Shorts Camisas Chompas Vestidos Faldas Blusas Casacas Abrigos Trajes Bufandas Pijamas Bodies Fajas]
# colors = %w[amarillo verde azul rojo negro blanco gris rosado morado carmesi magenta champagne indigo coral turquesa salmon beige lila]
# sizes = %w[XS S M L XL]
# prep = %w[de con sin para tipo]
# final = ["costuras", "malla", "cuello scoop bajo", "talle alto", "escote", "estampado", "bolsillo", "cuello unicolor", "cremallera delantera",
#         "dibujos animados", "parche", "aislamiento termico", "plumon engrosado", "manga larga", "manga corta", "atletico", "gemas del infinito",
#         "poderes", "wind power", "girl power", "bichota", "bunny", "classic", "aesthetic", "moonpay", "boleta", "menol", "free britney", "RiRi"]

# 50.times do
#   random_category = categories.sample
#   name = "#{random_category[..-2]} #{colors.sample} #{prep.sample} #{final.sample}"
#   bar_code =  Faker::Barcode.ean
#   cost = rand(20..40.0).round(2)
#   price = rand(50..60.0).round(2)
#   category = random_category
#   size = sizes.sample
#   stock = rand(10..20)
#   minimum_required = rand(10..15)

#   product_attr = {
#     name: name,
#     bar_code: bar_code,
#     cost: cost,
#     price: price,
#     category: category,
#     size: size,
#     stock: stock,
#     minimum_required: minimum_required
#   }

#   new_product = Product.new(product_attr)
#   new_product.warehouse = User.first.warehouses.first
#   new_product.save!

# end

# id del usiario a asignar movimientos

user_id = 6
user_products = User.find(user_id).warehouses.first.products
user_customers = Customer.where(user_id: user_id)
user_suppliers = Supplier.where(user_id: user_id)

# Rango de dias para crear los movimientos y maximos items por venta y compra

days_number = 90
max_orders_items = 3
max_purchases_items = 6

puts "Creando movimientos..."

while days_number != 0

  random_customer = user_customers.sample
  random_supplier = user_suppliers.sample

  Order.create(
    status: true,
    customer: random_customer,
    user_id: user_id,
    created_at: days_number.days.ago,
    updated_at: days_number.days.ago
  )

  rand(1..max_orders_items).times do
    random_product = user_products.sample
    random_quantity = rand(3..6)

    # Si la cantidad de la venta es mayor al stock disponible, busca otro producto

    random_product = user_products.sample while random_product.stock < random_quantity

    ListOrder.create(
      quantity: random_quantity,
      product: random_product,
      order: Order.last,
      created_at: days_number.days.ago,
      updated_at: days_number.days.ago
    )

    random_product.stock -= random_quantity
    random_product.save
  end

  # Genera compras cada 7 dias

  if (days_number % 7).zero?
    Purchase.create(
      status: true,
      supplier: random_supplier,
      user_id: user_id,
      created_at: days_number.days.ago,
      updated_at: days_number.days.ago
    )

    rand(1..max_purchases_items).times do
      random_product = user_products.sample
      random_quantity = rand(5..8)

      ListPurchase.create(
        quantity: random_quantity,
        product: random_product,
        purchase: Purchase.last,
        created_at: days_number.days.ago,
        updated_at: days_number.days.ago
      )

      random_product.stock += random_quantity
      random_product.save

    end

  end

  days_number -= 1
  max_orders_items += 3 if (days_number % 10).zero? && max_orders_items < 9

end

puts "Movimientos creados!"
