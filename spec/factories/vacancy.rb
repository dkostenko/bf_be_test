# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vacancy do
    title       { Faker::Lorem.characters(20) }
    contacts    { Faker::Lorem.characters(20) }
    salary      { 0 }
  end
end
