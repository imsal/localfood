require 'rails_helper'

# run tests with bin/rspec

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a name, email and password" do
    user = User.new(
    account_type: 'Admin',
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')

    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new( name: nil )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = User.new(
    account_type: 'Admin',
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: nil,
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "must match email regex" do
    user = User.new(
    account_type: 'Admin',
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: 'someinvalidemail',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it "is invalid with a duplicate email address" do
    User.create(
    name: 'Sal Tardibuono',
    account_type: 'Admin',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')

    user = User.new(
    name: 'Sal Tardibuono',
    account_type: 'Admin',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is invalid without an account type" do
    user = User.new(
    account_type: nil,
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf21',
    state: 'California')

    user.valid?
    expect(user.errors[:account_type]).to include("can't be blank")
  end

  it "is invalid when passwords don't match" do
    user = User.new(
    account_type: 'Admin',
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'meatloaf21',
    password_confirmation: 'meatloaf2122',
    state: 'California')

    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "doesn't allow custom account types; should raise ArgumentError" do
    user = User.new

    expect{
    user.account_type = 'Custom Account Name'
    }.to raise_error(ArgumentError)
  end

  it "must meet password requirements" do
    user = User.new(
    account_type: 'Admin',
    name: 'Sal Tardibuono',
    phone_number: '6619045259',
    email: 'saltad347@gmail.com',
    password: 'me',
    password_confirmation: 'me',
    state: 'California')

    user.valid?
    expect(user.errors[:password]).to include('must be between 8 and 40 characters, contain at least one number and at least one letter')
  end

  it "returns a user's full name as a string"
end
