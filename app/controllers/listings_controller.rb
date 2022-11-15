class ListingsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = Listing.find(params[:id])
  end

  def new
    @list = Listing.new
  end

  def create
  end

  def edit
    @list = Listing.new
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
