class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  def total_price
    product.retail_price * quantity
  end

  # def product_price
  #   product.retail_price
  # end

end
