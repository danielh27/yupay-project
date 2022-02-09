class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_product, only: %i[edit update destroy show]

  def index
    @products = Product.all
  end

  def show
    @list_purchase = ListPurchase.where(product_id: params[:id])
    @list_order = ListOrder.where(product_id: params[:id])

    @total = @list_purchase + @list_order
    @total.sort_by! { |p| p.created_at }
    @total.reverse!

    respond_to do |format|
      format.html
      format.json { @product }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.warehouse = current_user.warehouses.first
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    # @product.destroy no se va a destruir el producto, solo se va a ocultar con la funcion visible
    @product.visible = false
    @product.save
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :size, :price, :stock, :minimum_required, :cost, :visible, :photo)
  end
end
