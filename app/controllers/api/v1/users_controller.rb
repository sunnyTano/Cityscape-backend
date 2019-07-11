class Api::V1::UsersController < ApplicationController

    before_action :get_user, only: [:show, :update, :destroy]

    def index
      @users = User.all
      render json: @users
    end

    def new 
        @user = User.new
    end 

    def show
        render json: @user
    end 

    
	def create
		user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
			email: params[:email],
			password: params[:password],
		)
		if user.save

			token = encode_token(user.id)

			render json: {user: UserSerializer.new(user), token: token}
		else
			render json: {errors: user.errors.full_messages}
		end
	end
   
    def update
      @user.update(user_params)
      if @user.save
        render json: @user, status: :accepted
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
    end
   
    private
   
    def user_params
      params.permit(:first_name, :last_name, :email, :password_digest)
    end
   
    def get_user
      @user = User.find(params[:id])
    end


end
