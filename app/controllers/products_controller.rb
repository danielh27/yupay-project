class ProductsController < ApplicationController
<<<<<<< HEAD
 def index
   @product = Product.all
 end
=======
  skip_before_action :authenticate_user!
  before_action :set_product, only: %i[details edit update destroy]

  def dashboard
  end

  def index
    @products = Product.all
  end

  def details
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.warehouse = current_user.warehouse
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
    @product.destroy

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :size, :price, :stock, :minimum_required, :cost, :visible)
  end
>>>>>>> master
end
