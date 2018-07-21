class RentalBoxesController < ApplicationController
  before_action :authenticate_user!
  def show
    logger.debug "logger.debug 3"
    @rental_details = current_rental.rental_details
  end
end
