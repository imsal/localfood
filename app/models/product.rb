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


end
