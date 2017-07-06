class RentalsController < ApplicationController
  load_and_authorize_resource
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.status = "application"
    @rental.User = current_user
    if @rental.save
      redirect_to rentals_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to rentals_path
    else
      render 'edit'
    end
  end

  def destroy
    if @rental.Rental_id.nil?
      @rental.destroy
      redirect_to rentals_path
    else
      redirect_to rentals_path, notice: "その本は貸出中のため削除できません。"
    end
  end

private
    def rental_params
      params[:rental].permit(:rental_date, :due_date, :User_id, :status)
    end

    def set_rental
      @rental = Rental.find(params[:id])
    end
end
