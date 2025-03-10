class PagesController < ApplicationController
  def home
    @flat = Flat.first  # Or another logic to set the @flat instance variable
    @booking = Booking.new  # Ensure @booking is a new booking object
  end
  def index
    @flats = Flat.all
  end
end
