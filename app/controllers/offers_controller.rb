class OffersController < ApplicationController
  def index
    @offers = Offer.all.where(listing_id: params[:listing_id])
    @accept = false
  end

  def show
    @offer = Offer.find_by(listing_id: params[:listing_id])
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @offer = Offer.new
  end

  def create
    listing = Listing.find(params[:listing_id])
    offer = Offer.new(offer_params)
    offer.user = current_user
    offer.listing = listing
    if offer.save
      redirect_to user_offers_path(listing_id: listing.id, user_id: current_user)
    else
      pp offer.errors.full_messages
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def sales
    current_user.listings
  end

  def status
    @offer = Offer.find_by(listing_id: params[:listing_id])
  end

  def user_index
    @listings = Listing.find(current_user.offers.pluck(:listing_id).uniq)
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
