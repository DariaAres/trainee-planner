# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6, max_length: 20) }

    trait :with_last_name do
      last_name { Faker::Name.last_name }
    end
  end
end
