FactoryGirl.define do
  factory :user do
    account_type 'Admin'
    name 'Sal Tardibuono'
    phone_number '6619045259'
    sequence(:email) { |n| "email#{n}@example.com" }
    password 'meatloaf21'
    password_confirmation 'meatloaf21'
    state 'California'
  end
end
