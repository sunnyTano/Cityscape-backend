class ListingSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :bookings
  # belongs_to :host
  attributes :id, :neighborhood, :borough, :name, :price, :min_nights, :room_type, :image, :image_small, :amenitites, :description, :overview, :latitude, :longitude # :host_id, :host
end
