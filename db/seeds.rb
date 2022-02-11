require 'faker'

puts "Cleaning database..."


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

# Definicion fecha de creacion AQUI. OJO:

user_products = User.find(2).warehouses.first.products
days_number = 90
max_orders_items = 3

90.times do

  random_customer = Customer.where(user_id: 2).sample

  new_order = Order.new(
    status: true,
    customer: random_customer,
    user_id: 2,
    created_at: days_number.days.ago,
    updated_at: days_number.days.ago
  )

  rand(1..max_orders_items).times do
    new_order_item = ListOrder.new(
      quantity: rand(5..6),
      product: user_products.sample,
      order: new_order,
      created_at: days_number.days.ago,
      updated_at: days_number.days.ago
    )
  end

  new_order.save
  max_orders_items += 3 if days_number % 

end

puts "orders completed!"

10.times do
  new_purchase = Purchase.new(status: true, supplier_id: 3, user_id:1, created_at: fecha, updated_at: fecha)
  new_purchase.save!
  new_list_purchases = ListPurchase.new(
    quantity: 10,
    product_id: rand(1..50),
    purchase_id: Purchase.last.id,
    created_at: fecha,
    updated_at:fecha,

  )
  new_list_purchases.save!
  # 2do item
  new_list_purchases2 = ListPurchase.new(
    quantity: 10,
    product_id: rand(1..50),
    purchase_id: Purchase.last.id,
    created_at: fecha,
    updated_at:fecha,
  )
  new_list_purchases2.save!
end

puts "purchases completed!"
