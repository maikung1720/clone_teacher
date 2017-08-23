class RentalDetailsController < ApplicationController
  def create
    @rental = current_rental
    @rental_detail = @rental.rental_details.new(rental_detail_params)
    @rental.save
    session[:rental_id] = @rental.id
  end

  def update
    @rental = current_rental
    @rental_detail = @rental.rental_details.find(params[:id])
    @rental_detail.update_attributes(rental_detail_params)
    @rental_details = @rental.rental_details
  end

  def destroy
    @rental = current_rental
    @rental_detail = @rental.rental_details.find(params[:id])
    @rental_detail.destroy
    @rental_details = @rental.rental_details
  end
  
private
  def rental_detail_params
    params.require(:rental_detail).permit(:quantity, :labware_id)
  end
end
