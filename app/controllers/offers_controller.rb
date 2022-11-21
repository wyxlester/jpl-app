class OffersController < ApplicationController
  def index
    @listing = Listing.find(params[:listing_id])
    @offers = Offer.all.where(listing_id: params[:listing_id])
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
    offer.status = "pending"
    if offer.save
      redirect_to user_offers_path(listing_id: listing.id, user_id: current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @listing = Listing.find(params[:listing_id])
    @offer = Offer.find(params[:id])
    @offer.status = params[:offer][:status]
    if @offer.save
      @listing.offers.map do |offer|
        unless offer.id == @offer.id
          offer.status = "rejected"
          offer.save!
        end
      end
    end
    redirect_to listing_offers_path(@listing)
  end

  def destroy
  end

  def sales
    current_user.listings
  end

  def status
    # @offer = Offer.find_by(listing_id: params[:listing_id])
    # @offer.update_attribute(:status, true)
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
