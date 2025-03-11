class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flat = Flat.first # Or another logic to set the @flat instance variable
    @flats = Flat.all
  end
end
