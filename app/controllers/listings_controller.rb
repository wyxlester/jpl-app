class ListingsController < ApplicationController
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
  end

  def edit
    @listing = Listing.new
  end

  def update
  end

  def destroy
  end

  private

  def listing_params
    params.require(:listing).permit()
  end
end
