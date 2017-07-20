json.extract! order, :id, :first_name, :last_name, :email, :pay_type, :created_at, :updated_at
json.url order_url(order, format: :json)
