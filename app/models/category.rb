class Category < ActiveRecord::Base
  validates :genre, uniqueness: true

  has_many :categorized_products
  has_many :products, through: :categorized_products
end
