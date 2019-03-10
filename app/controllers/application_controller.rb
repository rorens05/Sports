class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :show_console
  before_action :authenticate_user, except: [:login, :logout, :attempt_login, :single_game, :result]
  before_action :check_user, only: [:login]

  def show_console
    if Rails.env.development?
      console
    end
  end

  def authenticate_user
    if session[:id] == nil
      redirect_to root_path
    end
  end

  def check_user
    if session[:id] != nil
      redirect_to admins_path
    end
  end
end
