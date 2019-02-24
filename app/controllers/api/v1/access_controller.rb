module Api
  module V1
    class AccessController < ApplicationController

      skip_before_action :verify_authenticity_token
      protect_from_forgery with: :null_session
      skip_before_action :authenticate_user

      def index
        sports = []
        images = []
        
        Sport.all.each do |sport|
          temp = sport.attributes
          temp[:logo] =  url_for(sport.logo)
          sports.push(temp)
        end
        
        render json: {status: 'success', message: 'sports loaded', data: sports}, status: :ok
      end   

      def attempt_login
        username = params['username']
        password = params['password']
    
        found_user = Admin.where(username: username).first
        if found_user
          if found_user.authenticate(password)
            render json: {status: 'success', message: 'Welcome', user: found_user}, status: :ok
          else
            render json: {status: 'Failed', message: 'Invalid username password combination'}, status: :unprocessable_entry
          end
        else
          render json: {status: 'failed', message: 'Invalid username password combination'}, status: :unprocessable_entry
        end
      end
    end
  end
end