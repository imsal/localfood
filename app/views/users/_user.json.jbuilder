json.extract! user, :id, :name, :business_name, :email, :password_digest, :street_address, :apartment, :city, :state, :zipcode, :account_type, :food_category, :created_at, :updated_at
json.url user_url(user, format: :json)
