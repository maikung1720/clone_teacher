require 'json'

class Api::BoxOpenerController < ApplicationController
  def index
      logger.debug "Come!!!!!!!!!!!!!!!!!"
      @users = User.where("card_no = ?", box_opener_params[:card_no])
      @users.each do |user|
          if user.role.eql?("teacher") then
               str = JSON.generate({ "status" => "approval" , "rack_no" => "all" })
          else
              @rentals = Rental.where("status = ? or status = ?", "approval","lending")
              @rentals.each do |rental|
                    if rental.User_id.eql?(user.id) then
                        str = JSON.generate({ "status" => rental.status , "card_no" => box_opener_params[:card_no], "rack_no" => rental.rack_no })
                        if rental.status.eql?("approval") then
                            rental.status = "lending"
                        else
                            rental.rental_details.each do |i|
                            labwares = Labware.where("name = ?",i.labware.name)
                                labwares.each do |labware|
                                    labware.circulation -= i.quantity
                                    labware.update(labware_params)
                                end
                            end
                            rental.status = "returned"
                        end
                        rental.update(rental_params)
                    end
              end
          end
          render :json => str and return
       end
  end
  
private
  def box_opener_params
    params.permit(:card_no)
  end
  def rental_params
      params.permit(:status)
  end
  
  def labware_params
      params.permit(:circulation)
  end
  
end