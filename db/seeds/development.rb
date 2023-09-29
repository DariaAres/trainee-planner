# frozen_string_literal: true

categories = %w[Personal Work Rest].map { |category| Category.find_or_create_by!(name: category) }

users = 5.times.map do |index|
  User.find_or_create_by(email: "user_#{index}@example.com") do |user|
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.password = 'password'
  end
rescue ActiveRecord::RecordInvalid => e
  Rails.logger.debug e.message
end

5.times do
  Event.create!(
    name: Faker::Lorem.word,
    event_date: Faker::Date.between(from: DateTime.now.tomorrow, to: 1.year.from_now),
    category: categories.sample,
    user: users.sample
  )
end

5.times do
  UserCategory.find_or_create_by!(
    user: users.sample,
    category: Category.find_or_create_by!(name: Faker::Lorem.unique.word)
  )
end
