class Api::V1::HostsController < ApplicationController

    before_action :get_host, only: [:show, :update, :destroy]

    def index
      @hosts = Host.all
      render json: @hosts
    end

    def new 
        @host = Host.new
    end 

    def show
        render json: @host
    end 

    def create
        @host = Host.create(host_params)
        render json: @host
    end 
   
    def update
      @host.update(host_params)
      if @host.save
        render json: @host, status: :accepted
      else
        render json: { errors: @host.errors.full_messages }, status: :unprocessible_entity
      end
    end
   
    private
   
    def host_params
      params.permit(:first_name, :last_name, :email, :password_digest)
    end
   
    def get_host
      @host = Host.find(params[:id])
    end


end
