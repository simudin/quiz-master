FactoryGirl.define do
  factory :question do
    content     { Faker::Lorem.sentence }
    answer      { Faker::Name.name }
  end
end
