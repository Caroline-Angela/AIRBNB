class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat

  # Show a list of bookings for a flat
  def index
    @bookings = @flat.bookings
  end

  # Create a new booking (assuming there's a form for this)
  def new
    @booking = @flat.bookings.new  # Initialize a new booking object
  end

  # Create a booking for a flat
  def create
    @booking = @flat.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      # Handle HTML and JSON formats
      respond_to do |format|
        format.html { redirect_to flat_bookings_path(@flat), notice: 'Booking created successfully.' }
        format.json { render json: @booking, status: :created }
      end
    else
      # Handle the case where booking fails
      respond_to do |format|
        format.html { render :new } # Render the form again if save fails
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Find and set the flat
  def set_flat
    @flat = Flat.find(params[:flat_id]) # Assuming bookings are related to flats
  end

  # Strong parameters for booking
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
