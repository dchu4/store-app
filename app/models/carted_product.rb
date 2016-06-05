class CartedProduct < ActiveRecord::Base
  validates :product_id, presence: true
  validates :user_id, presence: true

  validates :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  belongs_to :product
  belongs_to :user
  belongs_to :order
end
