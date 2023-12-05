puts "Destroying all previous data"
Review.destroy_all
DaysTimeSlot.destroy_all
ConfigTimeSlot.destroy_all
Booking.destroy_all
TimeSlot.destroy_all
Activity.destroy_all
Category.destroy_all
Recommendation.destroy_all
Property.destroy_all
User.destroy_all

Category.create!(name: "Food")
Category.create!(name: "Music")
Category.create!(name: "Corporate Services")
Category.create!(name: "Outdoors")
Category.create!(name: "Other")
puts "Categories created"


# ACTIVITIES = ["Cooking lesson", "Waterski", "DJ set", "Yoga lesson", "Paella at home", "IT equipment"]
LOCATIONS = ["Canggu", "Denpasar", "Nusa Dua", "Tanah Lot", "Bali"]

# 6.times do
#   User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: true
# end
# puts "Users created"

# # User.all.each do |user|
# #   Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
# #   Activity.create!(title: ACTIVITIES.sample, user: user, category: Category.first, price: rand(10..100), location: LOCATIONS.sample, max_people: rand(1..10), photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg")
# # end


5.times do
  User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => Faker::Internet.email, :password => 123456, :password_confirmation => 123456, is_provider: false
end

Activity.create(title: "Guitar Lesson", user: User.first, category: Category.second, price: 99, in_house: true, location: LOCATIONS.sample, max_people: 5, photo_url: "https://as2.ftcdn.net/v2/jpg/02/87/24/95/1000_F_287249541_Ui4Iqyp4ggPSuHg89yvvEWsB4ksH9jYT.jpg", duration: 2)
Activity.create(title: "Paella at Home", user: User.second, category: Category.first, price: 150, in_house: true, location: LOCATIONS.sample, max_people: 8, photo_url: "https://images.unsplash.com/photo-1534080564583-6be75777b70a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
Activity.create(title: "Yoga Session", user: User.third, category: Category.fourth, price: 50, in_house: true, location: LOCATIONS.sample, max_people: 6, photo_url: "https://plus.unsplash.com/premium_photo-1679596990572-9af483a16253?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
# Activity.create(title: "IT Equipment", user: User.fourth, category: Category.third, price: 300, in_house: true, location: LOCATIONS.sample, max_people: 1, photo_url: "https://images.unsplash.com/photo-1515603403036-f3d35f75ca52?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "Pool Party", user: User.fifth, category: Category.second, price: 499, in_house: true, location: LOCATIONS.sample, max_people: 15, photo_url: "https://images.unsplash.com/photo-1528495612343-9ca9f4a4de28?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
Activity.create(title: "Laundry Service", user: User.first, category: Category.fifth, price: 5, in_house: true, location: LOCATIONS.sample, max_people: 1, photo_url: "https://images.unsplash.com/photo-1567113463300-102a7eb3cb26?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
Activity.create(title: "Dj set", user: User.first, category: Category.second, price: 200, in_house: true, location: LOCATIONS.sample, max_people: 15, photo_url: "https://images.unsplash.com/photo-1571266028243-d220c6a7edbf?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
Activity.create(title: "Nany at home", user: User.second, category: Category.fifth, price: 80, in_house: true, location: LOCATIONS.sample, max_people: 3, photo_url: "https://images.unsplash.com/photo-1594950981383-6eb659d18fbf?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", duration: 1.5)
Activity.create(title: "Cooking Class", user: User.third, category: Category.first, price: 100, in_house: true, location: LOCATIONS.sample, max_people: 8, photo_url: "https://images.unsplash.com/photo-1519671282429-b44660ead0a7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
Activity.create(title: "Chef at home", user: User.fourth, category: Category.first, price: 69, in_house: true, location: LOCATIONS.sample, max_people: 8, photo_url: "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNoZWYlMjBhdCUyMGhvbWV8ZW58MHx8MHx8fDI%3D", duration: 1.5)
Activity.create(title: "Surfing Lesson", user: User.fourth, category: Category.fourth, price: 69, in_house: false, location: LOCATIONS.sample, max_people: 3, photo_url: "https://images.unsplash.com/photo-1636994029417-aabcb877f0a8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3VyZmluZyUyMGxlc3NvbnxlbnwwfHwwfHx8Mg%3D%3D", duration: 1.5)
Activity.create(title: "Shuttle Service", user: User.fifth, category: Category.fifth, price: 20, in_house: false, location: LOCATIONS.sample, max_people: 5, photo_url: "https://images.unsplash.com/photo-1473655587843-eda8944061e8?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZHJpdmVyfGVufDB8fDB8fHwy", duration: 1.5)
Activity.create(title: "Massage", user: User.fifth, category: Category.fifth, price: 35, in_house: true, location: LOCATIONS.sample, max_people: 8, photo_url: "https://images.unsplash.com/photo-1544161515-4ab6ce6db874?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFzc2FnZXxlbnwwfHwwfHx8Mg%3D%3D", duration: 1.5)
Activity.create(title: "Water ski", user: User.fourth, category: Category.fourth, price: 99, in_house: false, location: LOCATIONS.sample, max_people: 2, photo_url: "https://images.unsplash.com/photo-1473682150760-51d4f94b09d4?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHdhdGVyJTIwc2tpfGVufDB8fDB8fHwy", duration: 1.5)
Activity.create(title: "Wine Tasting", user: User.fifth, category: Category.fourth, price: 90, in_house: false, location: LOCATIONS.sample, max_people: 5, photo_url: "https://images.unsplash.com/photo-1558670460-cad0c19b1840?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d2luZSUyMHRhc3Rpbmd8ZW58MHx8MHx8fDI%3D", duration: 1.5)
Activity.create(title: "Waterfall Hike", user: User.first, category: Category.fourth, price: 60, in_house: false, location: LOCATIONS.sample, max_people: 6, photo_url: "https://images.unsplash.com/photo-1551518157-eeb214ad83cc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2F0ZXJmYWxsJTIwYmFsaXxlbnwwfHwwfHx8Mg%3D%3D", duration: 1.5)
Activity.create(title: "Scooter Rental", user: User.fourth, category: Category.fourth, price: 120, in_house: false, location: LOCATIONS.sample, max_people: 2, photo_url: "https://images.unsplash.com/photo-1580586216236-ef339c6a2daf?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNjb290ZXIlMjBiYWxpfGVufDB8fDB8fHww", duration: 1.5)
Activity.create(title: "Beach Bonfire", user: User.fifth, category: Category.fourth, price: 65, in_house: false, location: LOCATIONS.sample, max_people: 5, photo_url: "https://images.unsplash.com/photo-1569918970203-ea053ffda098?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmVhY2glMjBib25maXJlfGVufDB8fDB8fHwy", duration: 1.5)
Activity.create(title: "Sunset Hike", user: User.fifth, category: Category.fourth, price: 99, in_house: false, location: LOCATIONS.sample, max_people: 10, photo_url: "https://images.unsplash.com/photo-1437376576540-236661ddb41f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHN1bnNldCUyMGhpa2V8ZW58MHx8MHx8fDI%3D", duration: 1.5)
# puts "Activities created"


# User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => "test-provider@test.com", :password => 123456, :password_confirmation => 123456, is_provider: true
# User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => "test-user@test.com", :password => 123456, :password_confirmation => 123456, is_provider: false
# User.create! :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name, :email => "test-owner@test.com", :password => 123456, :password_confirmation => 123456, is_owner: true
# puts "Test users created"

# # 5.times do
# #   Property.create!(name: "Villa #{Faker::Address.city}", location: Faker::Address.street_address, user: users[rand(0..(users.length-1))])
# # end

# Property.create!(name: "Villa #{Faker::Address.city}", location: Faker::Address.street_address, user: User.where(email: "test-owner@test.com").first)
# Property.create!(name: "Villa #{Faker::Address.city}", location: Faker::Address.street_address, user: User.where(email: "test-owner@test.com").first)
# puts "Properties created"

# activities = Activity.all
# Property.all.each do |property|
#   5.times do
#     Recommendation.create!(property: property, recommendable: activities[rand(0..(activities.length-1))])
#   end
# end
# puts "Recommendations with activities created"

# restaurants = Restaurant.all
# Property.all.each do |property|
#   5.times do
#     Recommendation.create!(property: property, recommendable: restaurants[rand(0..(restaurants.length-1))])
#   end
# end
# puts "Recommendations with restaurants created"

# puts "Finished"
