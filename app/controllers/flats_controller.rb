class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
    render :add
  end
  def add
    @flat = Flat.new
    render :add
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path(@flat), notice: "Flat successfully created!"
    else
      render :add, status: unprocessable_entity
    end
  end


  private

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :address, photos: [])
  end
end
