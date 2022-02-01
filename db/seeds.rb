require 'faker'

categories = %w[Polos Jeans Shorts Camisas Chompas Vestidos Faldas Blusas Casacas Abrigos Trajes Bufandas Pijamas Bodies Fajas]
colors = %w[amarillo verde azul rojo negro blanco gris rosado morado carmesi magenta champagne indigo coral turquesa salmon beige lila]
sizes = %w[XS S M L XL]
prep = %w[de con sin para tipo]
final = ["costuras", "malla", "cuello scoop bajo", "talle alto", "escote", "estampado", "bolsillo", "cuello unicolor", "cremallera delantera",
        "dibujos animados", "parche", "aislamiento termico", "plumon engrosado", "manga larga", "manga corta", "atletico", "gemas del infinito",
        "poderes", "wind power", "girl power", "bichota", "bunny", "classic", "aesthetic", "moonpay", "boleta", "menol", "free britney", "RiRi"]

50.times do
  random_category = categories.sample
  name = "#{random_category[..-2]} #{colors.sample} #{prep.sample} #{final.sample}"
  bar_code =  Faker::Barcode.ean
  cost = rand(20..40.0).round(2)
  price = rand(50..60.0).round(2)
  category = random_category
  size = sizes.sample
  stock = rand(10..20)
  minimum_required = rand(10..15)

  product_attr = {
    name: name,
    bar_code: bar_code,
    cost: cost,
    price: price,
    category: category,
    size: size,
    stock: stock,
    minimum_required: minimum_required
  }

  new_product = Product.new(product_attr)
  new_product.warehouse = User.first.warehouses.first
  new_product.save
end
