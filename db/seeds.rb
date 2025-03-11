# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear the related records first to avoid foreign key violations
# Find or create users to avoid duplicates
user1 = User.find_or_create_by!(email: "user1_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

user2 = User.find_or_create_by!(email: "user2_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

user3 = User.find_or_create_by!(email: "user3_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

# Create flats
flat1 = Flat.create!(title: "Cozy Studio", description: "A small and cozy studio apartment.", price: 100, address: "123 Cozy St.", user: user1)
flat2 = Flat.create!(title: "Spacious Loft", description: "A spacious loft with great views.", price: 200, address: "456 Loft Ave.", user: user2)
flat3 = Flat.create!(title: "Luxury Penthouse", description: "A penthouse with a luxurious interior and rooftop access.", price: 500, address: "789 Penthouse Blvd.", user: user1)

# Create bookings
Booking.create!(user: user1, flat: flat1, start_date: "2025-03-10", end_date: "2025-03-15", status: "confirmed")
Booking.create!(user: user2, flat: flat2, start_date: "2025-03-12", end_date: "2025-03-20", status: "pending")
Booking.create!(user: user3, flat: flat3, start_date: "2025-03-15", end_date: "2025-03-18", status: "confirmed")
