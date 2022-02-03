class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @products = Product.all
    if params[:query].present?
      if params[:query] == '2'
      @products = Product.all.sort_by{ |product| product.stock }.take(5)
      elsif params[:query] == '3'
      @products = Product.all.sort_by{ |product| -product.stock}.take(5)
      end
    end
  end
end
