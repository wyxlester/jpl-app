class ListingsController < ApplicationController
  before_action :all_user
  skip_before_action :authenticate_user!, only: :show
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(listing_params)
    listing.user = @user.sample
    listing.save
    redirect_to listing_path(listing)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
  end

  def destroy
  end

  def seller
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
