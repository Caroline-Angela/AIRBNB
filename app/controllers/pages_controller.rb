class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    #@flat = Flat.first # Or another logic to set the @flat instance variable
        # @flats = Flat.all
    if params[:query].present?
    # sql_subquery = "title ILIKE :query OR description ILIKE :query OR address ILIKE :query"
    # @flats = @flats.where(sql_subquery, query: "%#{params[:query]}%")
    sql_subquery = 'flats.title ILIKE :query
      OR flats.description ILIKE :query
      OR flats.address ILIKE :query
      OR users.first_name ILIKE :query
      OR users.last_name ILIKE :query'
      @flats = Flat.joins(:user).where(sql_subquery, query:"%#{params[:query]}%")
    else
    @flats = Flat.all
    end
  end

  def dashboard
    @bookings = current_user.bookings
    @flats = current_user.flats
  end
end
