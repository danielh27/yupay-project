if @list_purchase.persisted?
  json.form json.partial!('list_purchases/quantity_form.html.erb', product: @product)
  json.inserted_item json.partial!('list_purchases/purchase_item.html.erb', item: @list_purchase)
  json.inserted_modal_item json.partial!('list_purchases/confirm_modal_item.html.erb', item: @list_purchase)
else
  json.form json.partial!('list_purchases/quantity_form.html.erb', product: @product)
end
json.total_sum(@total_sum)

# CREAR LOS PARTIALS!!!
