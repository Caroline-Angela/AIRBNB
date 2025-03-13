class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:index, :new, :create] 
  before_action :set_booking, only: [:show, :edit, :update, :destroy]


  def index
    @bookings = @flat.bookings
  end


  def new
    @booking = @flat.bookings.new
  end


  def create
    @booking = @flat.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save

      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Booking request created successfully.' }
        format.json { render json: @booking, status: :created }
      end
    else

      respond_to do |format|
        format.html { render :new }
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


  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end


  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
