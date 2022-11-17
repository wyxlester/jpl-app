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
    offer.user = current_user
    offer.save
    redirect_to offer_path(@offer)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def listing_params
    params.require(:offer).permit(:item_name, :offer_price, :listing_id, :user_id, :photo)
  end

  def all_user
    # delete this when we can have users
    @user = User.all
  end
end

