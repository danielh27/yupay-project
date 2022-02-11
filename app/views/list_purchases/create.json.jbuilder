# if @list_order.persisted?
#   json.form json.partial!('list_orders/quantity_form.html.erb', list_order: ListOrder.new, product: @product)
#   json.inserted_item json.partial!('list_orders/order_item.html.erb', item: @list_order)
#   json.inserted_modal_item json.partial!('list_orders/confirm_modal_item.html.erb', item: @list_order)
# else
#   json.form json.partial!('list_orders/quantity_form.html.erb', list_order: @list_order, product: @product)
# end
# json.total_sum(@total_sum)

# CREAR LOS PARTIALS!!!
