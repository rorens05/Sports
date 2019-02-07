class ApplicationController < ActionController::Base
  
  before_action :show_console

  def show_console
    if Rails.env.development?
      console
    end
  end
end
