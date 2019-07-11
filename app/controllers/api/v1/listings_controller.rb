class Api::V1::ListingsController < ApplicationController

    before_action :get_listing, only: [:show, :update, :destroy]
    before_action :authorized, only: [:create]

    def index
      @listings = Listing.all
      render json: @listings
    end

    def new 
        @listing = Listing.new
    end 

    def show
        render json: @listing
    end 

    def create
      @listing = @user.listings.create(listing_params)
      render json: @listing
    end 
   
    def update
      @listing.update(listing_params)
      if @listing.save
        render json: @listing, status: :accepted
      else
        render json: { errors: @listing.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
      @listing.destroy
      render json: @listing, status: :ok
    end 

    private
 
    def listing_params
      params.permit(:neighborhood, :borough, :name, :price, :min_nights, :room_type, :image, :image_small, :amenitites, :description, :overview, :latitude, :longitude)
    end
   
    def get_listing
      @listing = Listing.find(params[:id])
    end


end
