class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @reviews = @flat.reviews  # Ensure reviews are loaded
    end


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end
  def flat_params
    params.require(:flat).permit(:title, :price, :description, images: [])
  end

  private
  def flat_params
    params.require(:flat).permit(:title, :description, :price, :address)
  end
end
