FactoryGirl.define do
  factory :snippet do
    association :user, factory: :user
    association :kind, factory: :kind

    sequence(:title)  {|n| "#{Faker::Company.bs}-#{n}" }
    sequence(:work)   {|n| "#{Faker::Lorem.paragraph}-#{n}" }
  end
end
