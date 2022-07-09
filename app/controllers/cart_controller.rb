class CartController < ApplicationController
  def index
  end

  def add
    product = Product.find(params[:id])
    session[:cart] << product
    redirect_to products_path, notice: "#{product.name} has been added to cart"
  end

  def remove
  end
end
