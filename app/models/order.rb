class Order < ApplicationRecord

  has_many :line_items, dependent: :destroy
  belongs_to :user, optional:true

  enum pay_type: {
  "Check" => 0,
  "Credit Card" => 1,
  "Purchase Order" => 2
}

  validates :pay_type, inclusion: pay_types.keys


  enum status: {
    "Pending" => 0,
    "Payment Succesful" => 1,
    "Payment Failure" => 2,
    "Shipped" => 3,
    "Delivered" => 4,
    "Cancelled"  => 5
  }

  # validates :status, inclusion: statuses.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def convert_line_items_into_total(cart)
    total_monies_owed = 0.0
    cart.line_items.each do |item|
      total_monies_owed += (item.quantity * item.product.retail_price)
    end

    return total_monies_owed
  end


end
