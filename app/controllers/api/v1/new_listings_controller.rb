class Api::V1::NewListingsController < ApplicationController
    before_action :get_new_listing, only: [:show, :update, :destroy]
    before_action :authorized, only: [:create]
    def index
      @new_listings = NewListing.all
      render json: @new_listings
    end

    def new 
        @new_listing = NewListing.new
    end 

    def show
        render json: @new_listing
    end 

    def create
        @new_listing = @user.new_listings.create(new_listing_params)
        # byebug
        render json: @new_listing
    end 
   
    def update
      @new_listing.update(new_listing_params)
      if @new_listing.save
        render json: @new_listing, status: :accepted
      else
        render json: { errors: @new_listing.errors.full_messages }, status: :unprocessible_entity
      end
    end
    
    private

    def new_listing_params
      # params.permit(:image, :location, :price, :min_nights, :description, :user_id)
      params.require(:new_listing).permit(:image, :location, :price, :min_nights, :description)
    end

   
    def get_new_listing
      @new_listing = NewListing.find(params[:id])
    end

end
