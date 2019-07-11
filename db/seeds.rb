# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Host.destroy_all

# Booking.destroy_all
User.destroy_all

u1 = User.create(first_name: "Admin", last_name: "ILoveIcecream", email: "icecream@gmail.com", password_digest: "password")
# h1 = Host.create(first_name: "Susan", last_name: "Tan", email: "susan@gmail.com", password_digest: "password")
# l1 = Listing.create(neighborhood: "Dumbo", borough: "Brooklyn", name: "Great Lux Panda Room", price: "1000000", min_nights: "2", host: h1)

# require 'json'

Listing.destroy_all

listings = JSON.parse(File.read('data/listings.json'))
listings.each do |row|
    name=row['name']
    neighborhood=row['neighbourhood']
    borough=row['neighbourhood_group']
    price=row['price']
    min_nights=row['minimum_nights']
    room_type=row['room_type']
    image=row['picture_url']
    image_small=row['medium_url']
    amenitites=row['amenities']
    description=row['space']
    overview=row['neighbourhood_overview']
    latitude=row['latitude']
    longitude=row['longitude']
    # host_id=row['host_id']
    # puts min_nights
    u1.listings.create(neighborhood: neighborhood , borough: borough, name: name,
     price: price, min_nights: min_nights, room_type: room_type,
     image: image, image_small: image_small, amenitites: amenitites, description: description, overview: overview, longitude: longitude, latitude: latitude) # host_id: host_id)
end




# b1 = Booking.create(user: u1, listing: l1)

# require 'csv'

# Listing.destroy_all

# file_path = 'data/listing.csv'
#     CSV.foreach(Rails.root + file_path,
#                 headers: true, quote_char: "\x00", col_sep: "\t") do |row|
#                         name=row['name']
#                         neighborhood=row['neighbourhood']
#                         borough=row['neighbourhood_group']
#                         price=row['price']
#                         min_nights=row['minimum_nights']
#                         room_type=row['room_type']
#                         image=row['picture_url']
#                         image_small=row['medium_url']
#                         amenitites=row['amenities']
#                         description=row['space']
#                         overview=row['neighbourhood_overview']
#                         latitude=row['latitude']
#                         longitude=row['longitude']
#                     Listing.create(neighborhood: neighborhood , borough: borough, name: name,
#                     price: price, min_nights: min_nights, room_type: room_type,
#                     image: image, image_small: image_small, amenitites: amenitites, description: description, overview: overview, longitude: longitude, latitude: latitude) # host_id: host_id)
#                 # puts neighborhood
#     end