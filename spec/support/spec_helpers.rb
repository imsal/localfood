module SpecHelpers

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # # Returns the hash digest of the given string.
  # def digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #       BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

end


RSpec.configure do |c|
  c.include SpecHelpers
end
