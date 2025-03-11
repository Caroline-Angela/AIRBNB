class FlatsController < ApplicationController
  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end
end
