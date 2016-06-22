class ProductsController < ApplicationController
  before_action :admin_authentication, only: [:new, :edit, :update, :create, :destroy]

  def index
    @test_token = ENV[:test_api_token]
    @test_secret = ENV[:test_api_secret]

    sort_by_attr = params[:sort]
    sort_order = params[:sort_order]
    discount_price = params[:discount_price]

    random_product = params[:random_product]

    search_term = params[:search_term]

    category_type = params[:category_type]

    @books = Product.all

    if category_type
      @books = Category.find_by(genre: category_type).products
    end  

    if search_term
      @books = @books.where("title LIKE ?", "%#{search_term}%")
    end  

    if discount_price
      @books = @books.where("price < ?", discount_price)
    end

    if sort_by_attr && sort_order
      @books = @books.order(sort_by_attr => sort_order)
    elsif sort_order
      @books = @books.order(sort_order)
    end

  end

  def show
    @book = Product.find(params[:id])

    @categories = @book.categories
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
      #image: params[:image],
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
    @book = Product.find(params[:id])

    if @book.update(
      title: params[:title],
      author: params[:author],
      genre: params[:genre],
      synopsis: params[:synopsis],
      #image: params[:image],
      price: params[:price],
      quantity: params[:quantity],
      rating: params[:rating],
      description: params[:description],
      available: params[:available],
      supplier_id: params[:supplier_id]
      )

      flash[:success] = "Updated Book"
      redirect_to "/books/#{book.id}"
    else
      render :edit
    end  
 
  end

  def destroy
    book = Product.find(params[:id])
    book.destroy


    flash[:warning] = "Book Destroyed"
    redirect_to "/"
  end

private
  def admin_authentication
    unless user_signed_in? && current_user.admin
      redirect_to '/'
    end
  end
end
