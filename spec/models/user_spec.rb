require 'rails_helper'

# run tests with bin/rspec

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  # before do
  #   # set up test files
  #   @user = User.new(
  #   account_type: 'Admin',
  #   name: 'Sal Tardibuono',
  #   phone_number: '6619045259',
  #   email: 'saltad347@gmail.com',
  #   password: 'meatloaf21',
  #   password_confirmation: 'meatloaf21',
  #   state: 'California')
  # end

  # validation tests

  describe "attributes that don't allow nil" do
    it "name" do
      user = FactoryGirl.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "email" do
      user = FactoryGirl.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "account_type" do
      user = FactoryGirl.build(:user, account_type: nil)
      user.valid?
      expect(user.errors[:account_type]).to include("can't be blank")
    end
  end

  describe "password" do
    it "must meet regex requirements" do
      user = FactoryGirl.build(:user, password: 'me', password_confirmation: 'me')
      user.valid?
      expect(user.errors[:password]).to include('must be between 8 and 40 characters, contain at least one number and at least one letter')
    end

    it "is invalid when passwords don't match" do
      user = FactoryGirl.build(:user, password: 'meatloaf21', password_confirmation: 'meatloaf2122')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  it "is valid with a name, email and password" do
    # expect(@user).to be_valid
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "must match email regex" do
    user = FactoryGirl.build(:user, email: 'someinvalidemail')
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user, email: 'email@example.com')
    user = FactoryGirl.build(:user, email: 'email@example.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "doesn't allow custom account types; should raise ArgumentError" do
    user = FactoryGirl.build(:user)
    expect{
    user.account_type = 'Custom Account Name'
    }.to raise_error(ArgumentError)
  end

  it "should downcase email before saving model" do
    user = FactoryGirl.build(:user, email: 'SALtad347@gMAil.com')
    user.save
    expect(user.email).to eq('saltad347@gmail.com')
  end

  describe "should capitalize before saving" do
    it "name"
    it "business name"
    it "street address"
    it "food category"
    it "city"
  end

  it "returns a user's full name as a string"
  it "should save phone number in plain number format"

end
