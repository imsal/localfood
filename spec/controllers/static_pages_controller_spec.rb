require 'rails_helper'

# bin/rspec spec/controllers

RSpec.describe StaticPagesController, type: :controller do

  describe "#landing_page" do
    it "responds successfully" do
      get :landing_page
      expect(response).to be_success
    end

    # 200 is essentially the same as an 'Okay / Successful' response.
    it "returns a 200 response" do
      get :landing_page
      expect(response).to have_http_status "200"
    end

  end


end
