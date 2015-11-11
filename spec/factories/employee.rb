# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    name    { "раз два три" }
    email   { Faker::Internet.safe_email}
  end
end
