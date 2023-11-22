Booking.destroy_all
Activity.destroy_all
Category.destroy_all
User.destroy_all


Category.create!(name: "Food")
Category.create!(name: "Music")
Category.create!(name: "Corporate Services")
Category.create!(name: "Oudoors")

ACTIVITIES = ["Cooking lesson", "Waterski", "DJ set", "Yoga lesson", "Paella at home", "IT equipment"]
LOCATIONS = ["Malaga", "Velez Malaga", "Ronda", "Torremolinos", "Rincon de la Victoria", "Archidona", "Antequera"]

5.times do
  User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: true
end

User.all.each do |user|
  Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
  Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
end

5.times do
  User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: false
end
