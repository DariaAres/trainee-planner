# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    date { '2023-09-15 20:53:07' }
    description { 'MyText' }
    category { nil }
    date_to_notificate { '2023-09-15 20:53:07' }
  end
end
