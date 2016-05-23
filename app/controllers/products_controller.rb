class ProductsController < ApplicationController
  def index
    sort_by_attr = params[:sort]
    sort_order = params[:sort_order]
    discount_price = params[:discount_price]

    random_product = params[:random_product]

    search_term = params[:search_term]

    if search_term
      @books = Product.where("title LIKE ?", "%#{search_term}%")
    end  

    if discount_price
      @books = Product.where("price < ?", discount_price)
    end

    if sort_by_attr && sort_order
      @books = Product.order(sort_by_attr => sort_order)
    else
      @books = Product.all
    end

    if random_product
      @books = []
      book_holder = Product.all.sample
      @books << book_holder
    end
  end

  def show
    @book = Product.find(params[:id])
  end

  def random
    @book = Product.all.sample

    redirect_to "/books/#{@book.id}"
  end  

  def new

  end

  def create
    book = Product.create(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      synopsis: params[:synopsis],
      image: params[:image],
      price: params[:price],
      quantity: params[:quantity],
      rating: params[:rating],
      description: params[:description],
      available: params[:available],
      supplier_id: params[:supplier_id]

    )

    flash[:success] = "Created Book"
    redirect_to "/books/#{book.id}"
  end

  def edit
    @book = Product.find(params[:id])
  end

  def update
    book = Product.find(params[:id])

    book.update(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      synopsis: params[:synopsis],
      image: params[:image],
      price: params[:price],
      quantity: params[:quantity],
      rating: params[:rating],
      description: params[:description],
      available: params[:available],
      supplier_id: params[:supplier_id]
    )

    flash[:success] = "Updated Book"
    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Product.find(params[:id])
    book.destroy


    flash[:warning] = "Book Destroyed"
    redirect_to "/"
  end
end
