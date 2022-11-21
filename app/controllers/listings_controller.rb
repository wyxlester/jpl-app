class ListingsController < ApplicationController
  before_action :all_user
  skip_before_action :authenticate_user!, only: :index
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @listing.offers.each do |offer|
      if offer.user == current_user
        @offered = true
        @offered_price = offer.offer_price
      else
        @offered = false
      end
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(listing_params)
    listing.user = current_user
    listing.save
    redirect_to seller_listing_path(listing)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to seller_listing_path(@listing)
  end

  def destroy
  end

  def seller
    @listings = Listing.where(user: current_user)
  end

  private

  def listing_params
    params.require(:listing).permit(:item_name, :item_description, :price, :user, :photo)
  end

  def all_user
    # delete this when we can have users
    @user = User.all
  end
end
