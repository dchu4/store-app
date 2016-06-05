class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
  end  

  def create
    @carted_product = CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "Carted"
    )

    flash[:success] = "Added to cart"
    redirect_to '/carted_products'
  end


end
