# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Lorem.sentence(word_count: 2) }
    event_date { Faker::Time.between(from: DateTime.now.tomorrow, to: 1.year.from_now) }
    user { association :user }
    category { association :category }
  end

  trait :with_descriprition do
    description { Faker::Lorem.paragraph }
  end

  trait :with_date_to_notificate do
    date_to_notificate { event_date - 1.minute }
  end
end
