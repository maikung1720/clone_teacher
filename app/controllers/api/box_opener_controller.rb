require 'json'

class Api::BoxOpenerController < ApplicationController
  def index
      @users = User.where("card_no = ?", box_opener_params[:card_no])
      @users.each do |user|
          if user.role.eql?("teacher") then
              str = JSON.generate({ "status" => "approval" , "card_no" => box_opener_params[:card_no] })
          else
              @rentals = Rental.where("User_id= ? and status = ? and rental_date <= ? and due_date >= ? ", user.id, "approval", Time.zone.now, Time.zone.now)
              @rentals.each do |rental|
                  str = JSON.generate({ "status" => rental.status , "card_no" => box_opener_params[:card_no] })
              end
          end
          render json: str
       end
  end
  
private
  # リクエストパラメータのバリデーション
  def box_opener_params
    params.permit(:card_no)
  end
end