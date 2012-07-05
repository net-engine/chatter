FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password "password"
  end

  factory :message do
    user
    content 'A lovely message'
  end

end
