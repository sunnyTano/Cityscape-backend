class Api::V1::BookingsController < ApplicationController

    before_action :get_booking, only: [:show, :update, :destroy]

    def index
      @bookings = Booking.all
      render json: @bookings
    end

    def new 
        @booking = Booking.new
    end 

    def show
        render json: @booking
    end 

    def create
        @booking = Booking.create(booking_params)
        #TODO: play with the info being sent here
        render json: @booking
    end 
   
    def update
      @booking.update(booking_params)
      if @booking.save
        render json: @booking, status: :accepted
      else
        render json: { errors: @booking.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
      @booking.destroy
      render json: @booking, status: :ok
    end 

    private
   
    def booking_params
      params.permit(:user_id, :listing_id)
    end
   
    def get_booking
      @booking = Booking.find(params[:id])
    end

end
