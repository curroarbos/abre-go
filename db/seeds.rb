Booking.destroy_all
Activity.destroy_all
Category.destroy_all
User.destroy_all


Category.create!(name: "Food")
Category.create!(name: "Music")
Category.create!(name: "Corporate Services")
Category.create!(name: "Oudoors")
Category.create!(name: "Other")



# ACTIVITIES = ["Cooking lesson", "Waterski", "DJ set", "Yoga lesson", "Paella at home", "IT equipment"]
LOCATIONS = ["Canggu", "Uluwatu", "Seminyak", "Sanur", "Denpasar", "Nusa Dua", "Tanah Lot"]

6.times do
  User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: true
end

# User.all.each do |user|
#   Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
#   Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
# end


# 5.times do
#   User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: false
# end

Activity.create(title: "Guitar Lesson", user: User.first, category: Category.second, price: 99, location: LOCATIONS.sample, max_people: 5, photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
Activity.create(title: "Paella at Home", user: User.second, category: Category.first, price: 150, location: LOCATIONS.sample, max_people: 8, photo_url: "https://images.unsplash.com/photo-1534080564583-6be75777b70a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "Yoga Session", user: User.third, category: Category.fourth, price: 50, location: LOCATIONS.sample, max_people: 6, photo_url: "https://plus.unsplash.com/premium_photo-1679596990572-9af483a16253?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "IT Equipment", user: User.fourth, category: Category.third, price: 300, location: LOCATIONS.sample, max_people: 1, photo_url: "https://images.unsplash.com/photo-1515603403036-f3d35f75ca52?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "Party by the Pool", user: User.fifth, category: Category.second, price: 499, location: LOCATIONS.sample, max_people: 15, photo_url: "https://images.unsplash.com/photo-1528495612343-9ca9f4a4de28?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "Laundry Service", user: User.first, category: Category.fourth, price: 5, location: LOCATIONS.sample, max_people: 1, photo_url: "https://images.unsplash.com/photo-1567113463300-102a7eb3cb26?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")


User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => "test-provider@test.com", :password => 123456, :password_confirmation => 123456, is_provider: true
User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => "test-user@test.com", :password => 123456, :password_confirmation => 123456, is_provider: false
