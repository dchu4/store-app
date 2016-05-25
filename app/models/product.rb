# Product model and model methods
class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  TAXRATE = 0.09

  def sale_message
    if price < 20
      'Discounted'
    else
      'Everyday low prices'
    end
  end

  def tax
    @tax = price * TAXRATE
  end

  def total
    price + tax
  end

  def image_preview
    images.first.url
  end
end
