require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

=begin
  describe "no user is logged in" do
    it "profile dropdown should not be accessible"
  end

  describe "any user is logged in" do
    it "profile dropdown should be accessible" do
      get root_url
      user = FactoryGirl.build(:user)
      log_in(user)
    end

  end

  describe "admin user is logged in" do
  end

  describe "business user is logged in" do
  end

  describe "customer user is loggen in" do
  end
=end

end
