class Api::V1::AuthController < ApplicationController

  before_action :authorized, only: [:auto_login]
  
    def login
      # check if my params contain the entered email and password
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
  
        token = encode_token(user.id)
  
        render json: {user: UserSerializer.new(user), token: token}
  
        # render json: user
      else
        render json: {errors: "Invalid User"}
      end
    end
  
    def auto_login
        token = encode_token(@user.id)
        render json: {user: UserSerializer.new(@user), token: token}
    end
  end