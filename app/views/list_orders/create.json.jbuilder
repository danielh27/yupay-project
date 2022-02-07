if @list_order.persisted?
  # json.form json.partial!('list_orders/order_form_items.html.erb', list_order: ListOrder.new)
  json.inserted_item json.partial!('list_orders/order_item.html.erb', item: @list_order)
# else
  # json.form json.partial!('list_orders/order_form_items.html.erb', list_order: @list_order)
end
