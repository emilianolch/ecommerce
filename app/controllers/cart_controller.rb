class CartController < ApplicationController
  def index
    @products = session[:cart].map { |id| Product.find(id) }
    redirect_to products_path if @products.empty?
  end

  def add
    product = Product.find(params[:id])
    session[:cart] << product.id
    redirect_to products_path, notice: "#{product.name} has been added to cart"
  end

  def remove
    session[:cart].delete_at(params[:index].to_i)
    redirect_to cart_index_path
  end
end
