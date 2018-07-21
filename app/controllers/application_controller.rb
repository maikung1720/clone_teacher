require 'date'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :current_rental

  def current_rental
    if !session[:rental_id].nil?
      Rental.find(session[:rental_id])
    else
      Rental.new
    end
  end
  def current_rental_for_delete
    if !session[:rental_id].nil?
      Rental.find(session[:rental_id])
    else
      Rental.new
    end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role, :name, :card_no, :number, :class_rooom, :studentid, :image) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :role, :name, :card_no, :number, :class_rooom, :studentid, :image) }
  end
end
