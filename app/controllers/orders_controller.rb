class OrdersController < ApplicationController
  def create
    Order.create(
      quantity: params[:quantity],
      product_id: params[:product_id]
    )
  end  
end
