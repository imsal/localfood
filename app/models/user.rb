class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :orders


=begin
  before_save :downcase_email
  before_save :capitalize_name
  before_save :capitalize_business_name
  before_save :capitalize_street_address
  before_save :format_phone_number


  #validations
  enum account_type: {
    "Admin" => 0,
    "Customer" => 1,
    "Business" => 2
  }

  enum state: {
    "Alabama" => 0,
    "Alaska" => 1,
    "Arizona" => 2,
    "Arkansas"  => 3,
    "California"  => 4,
    "Colorado"  => 5,
    "Connecticut"  => 6,
    "Delaware"  => 7,
    "Florida" => 8,
    "Georgia" => 9,
    "Hawaii" => 10,
    "Idaho"=> 11,
    "Illinois" => 12,
    "Indiana" => 13,
    "Iowa" => 14,
    "Kansas" => 15,
    "Kentucky" => 16,
    "Louisiana" => 17,
    "Maine " => 18,
    "Maryland" => 19,
    "Massachusetts" => 20,
    "Michigan" => 21,
    "Minnesota" => 22,
    "Mississippi" => 23,
    "Missouri" => 24,
    "Montana" => 25,
    "Nebraska" => 26,
    "Nevada" => 27,
    "New Hampshire" => 28,
    "New Jersey" => 29,
    "New Mexico" => 30,
    "New York" => 31,
    "North Carolina" => 32,
    "North Dakota" => 33,
    "Ohio" => 34,
    "Oklahoma" => 35,
    "Oregon" => 36,
    "Pennsylvania" => 37,
    "Rhode Island" => 38,
    "South Carolina" => 39,
    "South Dakota" => 40,
    "Tennessee" => 41,
    "Texas" => 42,
    "Utah" => 43,
    "Vermont" => 44,
    "Virginia" => 45,
    "Washington" => 46,
    "West Virginia" => 47,
    "Wisconsin" => 48,
    "Wyoming" => 49
  }



  validates :state, inclusion: states.keys
  validates :account_type, presence: true, inclusion: account_types.keys
  validates :name, presence: true
  validates :phone_number, presence: true # validate format of phone number later 661-904-5259 (ADD EXTENSION)
  validates :email, presence: true, format: { with: /.+@.+/}, uniqueness: {case_sensitive: false}
  # https://stackoverflow.com/questions/11992544/validating-password-using-regex

  # password requirements: Password should contain atleast one integer, atleast one alphabet(either in downcase or upcase), Password can have special characters from 20 to 7E ascii values, Password should be minimum of 8 and maximum of 40 cahracters long
  # https://ajaxonrails.wordpress.com/2006/10/19/using-regular-expression-in-ruby-on-rails-regex-for-password-validation/
  validates :password, presence: true, format: { with: /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}\z/, message: 'must be between 8 and 40 characters, contain at least one number and at least one letter' },
  allow_nil: true


  def downcase_email
    self.email.downcase!
  end

  def capitalize_name
    self.name = self.name.titleize
  end

  # optional attribute -- business only
  def capitalize_business_name
    if self.business_name != nil
      self.business_name = self.business_name.titleize
    end
  end

  def capitalize_street_address
    if self.street_address != nil
      self.street_address = self.street_address.titleize
    end
  end

  =begin
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  =end

  def format_phone_number
    self.phone_number.gsub(/\D/, '')
  end
=end

end
