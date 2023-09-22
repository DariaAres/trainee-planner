# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[Personal Work Rest].each { |category| Category.find_or_create_by!(name: category) }

5.times do |index|
  User.find_or_create_by(email: "user_#{index}@example.com") do |user|
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.password = 'password'
  end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.debug e.message
end

300.times do
  Event.create!(
    name: Faker::Lorem.word,
    description: "Sorry, but I cannot provide informespect the privacy and security of others' onlinecor contac" * 10,
    date: Faker::Date.between(from: DateTime.now.tomorrow, to: 1.year.from_now),
    date_to_notificate: DateTime.now + 1.minute,
    category: Category.all.sample,
    user: User.all.sample
  )
end
