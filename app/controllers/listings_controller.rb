class ListingsController < ApplicationController
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
    @user = User.all
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
end
