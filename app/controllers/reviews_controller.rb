class ReviewsController < ApplicationController
  before_action :find_flat
  before_action :authenticate_user!
  before_action :find_review, only: [:edit, :update, :destroy]



  def create
    @review = Review.new(review_params)
    @review.flat_id = @flat.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to flat_path(@flat), notice: 'Review was successfully created.'
    else
      @reviews = @flat.reviews.includes(:user)
      render 'flats/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to flat_path(@flat), notice: 'Review was successfully deleted.'
  end

  private

  def find_review
    @review = @flat.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end
end
