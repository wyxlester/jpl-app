class ListingsController < ApplicationController
  before_action :all_user
  def index
    @listing = Listing.all
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
  end

  def edit
    @listing = Listing.new
  end

  def update
  end

  def destroy
  end

  def seller
  end

  private

  def listing_params
    params.require(:listing).permit(:item_name, :item_description, :price, :user)
  end

  def all_user
    # delete this when we can have users
    @user = User.all
  end
end
