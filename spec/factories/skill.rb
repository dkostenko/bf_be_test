# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    name { Faker::Lorem.characters(20) }
  end
end
