class RentalBoxesController < ApplicationController
  def show
    @rental_details = current_rental.rental_details
  end
end
