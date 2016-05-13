class ProductsController < ApplicationController
  def index
    @books = Product.all
  end

  def show
    @book  = Product.find(params[:id])
  end

  def new

  end

  def create
    @book =  Product.create(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      synopsis: params[:synopsis],
      image: params[:image],
      price: params[:price],
      quantity: params[:quantity],
      rating: params[:rating]
    )

    render 'show.html.erb'
  end

  def edit
    @book = Recipe.find(params[:id])
  end

  def update
    
  end
end
