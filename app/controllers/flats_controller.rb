class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = @flat.reviews.includes(:user).order(created_at: :desc)
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
      redirect_to dashboard_path, notice: "Flat successfully created!"
    else
      render :add, status: unprocessable_entity
    end
  end


  private

  def flat_params
    params.require(:flat).permit(:title, :description, :price, :address, photos: [])
  end
end
