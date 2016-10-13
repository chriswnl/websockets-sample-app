class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :check_user  
  
  # fake a current_user
  
  def current_user
    # assigns you as a random user from the users table
    #@current_user ||= session["current_user"] || User.all.sample(1).first
    #cookies.signed[:cablechat] ||= {}
    @current_user ||= cookies.signed[:cablechat] ? User.find(cookies.signed[:cablechat]) : User.all.sample(1).first
  end
  
  helper_method :current_user
  
  private
  
  def check_user
    
    current_user.present?
    cookies.signed[:cablechat] = current_user.id
  end
end
