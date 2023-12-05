class Restaurant < ApplicationRecord
  has_many :recommendations, as: :recommendable

  def enrich(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = ENV["BUSINESS_LOCAL_DATA_KEY"]
    request["X-RapidAPI-Host"] = 'local-business-data.p.rapidapi.com'

    response = http.request(request).read_body

    details = JSON.parse(response)

    self.name = details["data"][0]["name"]
    self.address = details["data"][0]["address"]
    self.latitude = details["data"][0]["latitude"]
    self.longitude = details["data"][0]["longitude"]
    self.rating = details["data"][0]["rating"]
    self.review_count = details["data"][0]["review_count"]
    self.telephone_number = details["data"][0]["phone_number"]
    self.google_link = details["data"][0]["share_link"]
    self.photo_url = details["data"][0]["photos_sample"][0]["photo_url"]
  end

  include PgSearch::Model
  multisearchable against: [:name, :address]
end
