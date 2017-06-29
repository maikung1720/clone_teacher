class LabwaresController < ApplicationController
  before_action :set_labware, only: [:show, :edit, :update, :destroy]

  def index
    @labwares = Labware.all
  end

  def show
  end

  def new
    @labware = Labware.new
  end

  def create
    @labware = Labware.new(labware_params)
    if @labware.save
      redirect_to labwares_path
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
      params[:labware].permit(:name, :description, :quantity, :code, :image)
    end

    def set_labware
      @labware = Labware.find(params[:id])
    end
end
