class AccessController < ApplicationController
  def login
  end

  def attempt_login
    username = params['username']
    password = params['password']

    found_user = Admin.where(username: username, user_type: 'admin').first
    if found_user
      if found_user.authenticate(password)
        session[:id] = found_user.id
        redirect_to found_user
      else
        return_to_login
      end
    else
      return_to_login
    end
  end

  def logout
    session[:id] = nil
    redirect_to root_path
  end

  private
  def return_to_login
    flash[:notice] = 'Invalid username and password combination'
    redirect_to root_path
  end
end
