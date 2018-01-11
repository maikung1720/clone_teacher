require 'json'

class Api::BoxOpenerController < ApplicationController
  def index
      logger.debug "Come!!!!!!!!!!!!!!!!!"
      @users = User.where("card_no = ?", box_opener_params[:card_no])
      @users.each do |user|
          if user.role.eql?("teacher") then
               str = JSON.generate({ "status" => "approval" , "rack_no" => "all" })
          else
            #   @rentals = Rental.where("status = ? or status = ?", "approval","lending").where("User_id= ? and rental_date <= ? and due_date >= ? ", user.id, Time.parse("00:00"), Time.parse("00:00"))
              @rentals = Rental.where("status = ? or status = ?", "approval","lending")
              logger.debug Time.parse("00:00")
              logger.debug "1"
              @rentals.each do |rental|
                  logger.debug "2"
                    if rental.User_id.eql?(user.id) then
                        logger.debug "3"
                        str = JSON.generate({ "rack_no" => rental.rack_no })
                        if rental.status.eql?("approval") then
                            logger.debug "4"
                            rental.status = "lending"
                        else
                            logger.debug "5"
                            rental.rental_details.each do |i|
                            labwares = Labware.where("name = ?",i.labware.name)
                                labwares.each do |labware|
                                    labware.circulation -= i.quantity
                                    labware.update(labware_params)
                                end
                            end
                            logger.debug "6"
                            rental.status = "returned"
                        end
                        logger.debug "7"
                        rental.update(rental_params)
                    end
              end
          end
          logger.debug "8"
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