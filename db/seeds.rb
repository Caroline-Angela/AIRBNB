require "open-uri"

# Clean up

User.destroy_all
Flat.destroy_all
Booking.destroy_all

puts "DB content deleted..."

user1 = User.find_or_create_by!(email: "user1_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.first_name = "Brad"
  user.last_name = "Pitt"
end
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.fxbGHlo7u5oktrwvHoTz1QHaJW&pid=Api").open
user1.photo.attach(io: file, filename: "brad.png", content_type: "image/jpg")
user1.save
puts "Is an image attached to #{user1.first_name} ? #{user1.photo.attached?}"


user2 = User.find_or_create_by!(email: "user2_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.first_name = "Nina"
  user.last_name = "Simone"
end
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.0SHIGTtCu_DFEApvh9nyjwHaIV&pid=Api").open
user2.photo.attach(io: file, filename: "nina.png", content_type: "image/jpg")
user2.save
puts "Is an image attached to #{user2.first_name} ? #{user2.photo.attached?}"

user3 = User.find_or_create_by!(email: "user3_unique@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.first_name = "Celine"
  user.last_name = "Dion"
end
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.XbvOV9BhRCgh95A8VbmdhwHaHa&pid=Api").open
user3.photo.attach(io: file, filename: "brad.png", content_type: "image/jpg")
user3.save
puts "Is an image attached to #{user3.first_name} ? #{user3.photo.attached?}"

puts "#{User.all.length} Users created..."

# Create flats

# Flat 1 Cozy studio
flat1 = Flat.create!(
  title: "Cozy Studio",
  description: "A small and cozy studio apartment.",
  price: 100,
  address: "123 Cozy St.",
  user: user1,
  latitude: 51.5074,    # London coordinates
  longitude: -0.1278
)
# Adding pictures
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.-9veEwfK5l83Kyy7SgjzAgHaE7&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding1.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.tY7bn_18wSvvQKyGBODVpQHaE8&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding2.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.YOdbZbggLlmGwgSvi8d0-wAAAA&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding3.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.B88A-Mm6VyEHLBymn0CYJwHaFj&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding4.png", content_type: "image/jpg")
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.SNqrZyVF65iKa3h5MjrjOgAAAA&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding5.png", content_type: "image/jpg")
file = URI.parse("https://tse2.mm.bing.net/th?id=OIP.PbJzSCw5WU1KZdNkCtiN1wAAAA&pid=Api").open
flat1.photos.attach(io: file, filename: "seeding6.png", content_type: "image/jpg")
flat1.save
puts "Is an image attached to #{flat1.title} ? #{flat1.photos.attached?}"

# Flat 2 spacious loft
flat2 = Flat.create!(
  title: "Spacious Loft",
  description: "A spacious loft with great views.",
  price: 200,
  address: "456 Loft Ave.",
  user: user2,
  latitude: 48.8566,    # Paris coordinates
  longitude: 2.3522
)

file = URI.parse("https://tse2.mm.bing.net/th?id=OIP.0n9npsScE2_lJyjGyVvITwHaE8&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding7.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.IdYaVF-t8WLAD3hG6tnxRAHaEc&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding8.png", content_type: "image/jpg")
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.z2cpdj8Cr9GkpHHiGeI6WQHaE8&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding9.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.dyGuCpwEK-5baGK629iGVwHaE8&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding10.png", content_type: "image/jpg")
file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.XrxhBsmyuToQkZqKA3izBAHaE7&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding11.png", content_type: "image/jpg")
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.GaDiByiY8NOe9ZslaxHrJAHaHa&pid=Api").open
flat2.photos.attach(io: file, filename: "seeding12.png", content_type: "image/jpg")
flat2.save
puts "Is an image attached to #{flat2.title} ? #{flat2.photos.attached?}"

# Flat 3 luxury penthouse
flat3 = Flat.create!(
  title: "Luxury Penthouse",
  description: "A penthouse with a luxurious interior and rooftop access.",
  price: 500,
  address: "789 Penthouse Blvd.",
  user: user3,
  latitude: 40.7128,    # New York coordinates
  longitude: -74.0060
)
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.GaDiByiY8NOe9ZslaxHrJAHaHa&pid=Api").open
flat3.photos.attach(io: file, filename: "seeding13.png", content_type: "image/jpg")
flat3.save
puts "Is an image attached to #{flat3.title} ? #{flat3.photos.attached?}"

flat4 = Flat.create!(
  title: "Roof-top villa",
  description: "a villa nested on another villa. Exciting !",
  price: 500,
  address: "Rotterdam",
  user: user1,
  latitude: 51.9244,    # Rotterdam coordinates
  longitude: 4.4777
)

file = URI.parse("https://tse3.mm.bing.net/th?id=OIP.VyB3IrH7TWdpMH7ZqlBZpwHaEK&pid=Api").open
flat4.photos.attach(io: file, filename: "seeding13.png", content_type: "image/jpg")
flat4.save
puts "Is an image attached to #{flat4.title} ? #{flat4.photos.attached?}"

flat5 = Flat.create!(
  title: "Tiny House",
  description: "A very Tiny tiny house.",
  price: 20,
  address: "Rue des invalides 102, Paris",
  user: user2,
  latitude: 48.8584,    # Paris Invalides coordinates
  longitude: 2.3129
)
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.AIEsFbF5l7hyI1NwX0_AmgHaHa&pid=Api").open
flat5.photos.attach(io: file, filename: "seeding13.png", content_type: "image/jpg")
flat5.save
puts "Is an image attached to #{flat5.title} ? #{flat5.photos.attached?}"

flat6 = Flat.create!(
  title: "Mar-a-lago mansion",
  description: "A strange place with a big Donald",
  price: 5000,
  address: "Miami",
  user: user3,
  latitude: 25.7617,    # Miami coordinates
  longitude: -80.1918
)

file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.dwqdFDrKcBidDPP_ZSN_bgHaER&pid=Api").open
flat6.photos.attach(io: file, filename: "seeding13.png", content_type: "image/jpg")
flat6.save
puts "Is an image attached to #{flat6.title} ? #{flat6.photos.attached?}"

puts "#{Flat.all.length} Flats created..."

# Create bookings
Booking.create!(user: user1, flat: flat2, start_date: "2025-03-10", end_date: "2025-03-15", status: "pending")
Booking.create!(user: user2, flat: flat3, start_date: "2025-03-12", end_date: "2025-03-20", status: "pending")
Booking.create!(user: user3, flat: flat1, start_date: "2025-03-15", end_date: "2025-03-18", status: "confirmed")

puts "#{Booking.all.length} Bookings created..."
puts "Seeding is finished"
