class OffersController < ApplicationController
  def index
    @offer = Offer.where(listing_id: params[:listing_id])
    @user = current_user
  end

  def show
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @offer = Offer.new
  end

  def create
    offer = Offer.new(offer_params)
    offer.user = current_user
    offer.save

    redirect_to listing_path(params[:listing_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:offer_price)
  end

  def all_user
    # delete this when we can have users
    @user = User.all
  end
end
