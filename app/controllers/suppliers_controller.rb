class SuppliersController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone: params[:phone])

    flash[:success] = "Supplier Created"
    redirect_to "/suppliers/#{supplier.id}"
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy

    flash[:warning] = "Supplier Destroyed"
    redirect_to "/"
  end

  def update
    supplier = Supplier.update(
      name: params[:name],
      email: params[:email],
      phone: params[:phone])

    flash[:success] = "Supplier Updated"
    redirect_to "/suppliers/#{supplier.id}"
  end

end
