class PurchasesController < ApplicationController
  def new
    purchase = Purchase.new
    purchase.supplier = Supplier.first

    @list_purchase = ListPurchase.new
    @list_purchase.purchase = purchase
  end
end
