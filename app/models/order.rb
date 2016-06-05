class Order < ActiveRecord::Base
  validates user_id, presence: true

  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
end
