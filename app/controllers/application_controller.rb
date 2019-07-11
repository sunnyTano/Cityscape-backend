class ApplicationController < ActionController::API


    def encode_token(user_id)
      JWT.encode({user_id: user_id}, "beefysteak")
    end
    
    def get_auth_headers
      # byebug
      request.headers["Authorization"]
    end
  
    def decode_token
      begin
        JWT.decode(get_auth_headers, "beefysteak")
      rescue
        nil
      end
    end
  

    def current_user
      if decode_token
        user_id = decode_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
   
    def logged_in?
      !!current_user
    end
   
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end