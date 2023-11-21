# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Activity.create(title: "Best Chef in Town", price: 99, location: "Bali", max_people: 3, photo_url: "https://st.depositphotos.com/1499736/2462/i/950/depositphotos_24628361-stock-photo-chef-decorating-pasta-salad-with.jpg")
Activity.create(title: "DJ for disco party", price: 300, location: "London", max_people: 6, photo_url: "https://st.depositphotos.com/1499736/2462/i/950/depositphotos_24628361-stock-photo-chef-decorating-pasta-salad-with.jpg")
Activity.create(title: "Horse riding", price: 50, location: "Uluwatu", max_people: 5, photo_url: "https://st.depositphotos.com/1499736/2462/i/950/depositphotos_24628361-stock-photo-chef-decorating-pasta-salad-with.jpg")
Activity.create(title: "Local supper club in your house", price: 200, location: "Bali", max_people: 10, photo_url: "https://st.depositphotos.com/1499736/2462/i/950/depositphotos_24628361-stock-photo-chef-decorating-pasta-salad-with.jpg")

