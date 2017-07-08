class Product < ApplicationRecord
  belongs_to :user

  # enum user_id: user_business_hash
  #
  # validates :user_id, inclusion: user_ids.keys

  # this method takes all user accounts with a business
  # account type and maps it to a hash where key = busness_name & value = user_id
  #
  # def user_business_hash
  #   array = User.where(account_type: 'Business').map{|x| [x.business_name, x.id] }
  #
  #   hash = array.inject({}) do |memo, (key, value)|
  #     memo[key] = value
  #     memo
  #   end
  #
  #   return hash
  # end

  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true

  # ensures that the sellers can't set a product for $0 && ensure that price is a number
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  validates :title, uniqueness: true, length: { minimum: 10}


  # the allow_blank option is used to avoid from getting multiple error messages when the field is blank.
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }


  private

  # ensure that there are no line items referencing this product

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end


end
