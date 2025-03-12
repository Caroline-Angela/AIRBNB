class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:index, :new, :create] # was inteferring with CRUD actions had to do this, doesnt seem to break anything
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # Show a list of bookings for a flat
  def index
    @bookings = @flat.bookings
  end

  # Create a new booking (assuming there's a form for this) YES USED (PEC)
  def new
    @booking = @flat.bookings.new  # Initialize a new booking object
  end

  # Create a booking for a flat -- YES USED (PEC)
  def create
    @booking = @flat.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save
      # Handle HTML and JSON formats
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Booking request created successfully.' }
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    @booking.save
    redirect_to dashboard_path
  end

  # CRUD actions for bookings for now only show and destroy are implemented edit/update could be used later on
  def show
    redirect_to flat_path(@booking.flat)
  end

  def edit
  end

  def update
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end




  private

  # Find and set the flat
  def set_flat
    @flat = Flat.find(params[:flat_id]) # Assuming bookings are related to flats
  end

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  # Strong parameters for booking
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
