class RentalBoxesController < ApplicationController
  before_action :authenticate_user!
  def show
    @rental_details = current_rental.rental_details
  end
end
