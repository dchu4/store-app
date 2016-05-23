class Product < ActiveRecord::Base
  TAXRATE = 0.09

  def sale_message
    if price < 20
      "Discounted"
    else
      "Everyday low prices"
    end    
  end

  def tax
    @tax = price * TAXRATE
  end

  def total
    price + tax
  end  
end
