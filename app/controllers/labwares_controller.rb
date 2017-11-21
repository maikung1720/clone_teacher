class LabwaresController < ApplicationController
  load_and_authorize_resource
  
  before_action :authenticate_user!
  before_action :set_labware, only: [:show, :edit, :update, :destroy]

  def index
    if params[:labware_group].blank?
      @labware_group = "physics"
    else 
      @labware_group = params[:labware_group]
    end
    @labwares = Labware.where(:code => @labware_group)
    @rental_detail = current_rental.rental_details.new
  end

  def show
  end

  def new
    @labware = Labware.new
  end

  def create
    @labware = Labware.new(labware_params)
    if @labware.save
      logger.debug @labware.code.to_s + "  CCCC"
      redirect_to labwares_path(labware_group: @labware.code.to_s.downcase)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @labware.update(labware_params)
      redirect_to labwares_path
    else
      render 'edit'
    end
  end

  def destroy
    # if @labware.Rental_id.nil?
      @labware.destroy
      redirect_to labwares_path
    # else
    #   redirect_to labwares_path, notice: "その本は貸出中のため削除できません。"
    # end
  end

  private

    def labware_params
      params[:labware].permit(:name, :description, :quantity, :code)
    end

    def set_labware
      @labware = Labware.find(params[:id])
    end
end
