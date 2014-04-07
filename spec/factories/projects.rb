# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    text { Faker::Lorem.characters(rand(1..100)) }
    association :owner, factory: :user
    
    factory :invalid_question do
      text nil
    end
  end
end