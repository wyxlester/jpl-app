class OffersController < ApplicationController
  def index
    @offer = Offer.where(listing_id: params[:listing_id])
    @user = current_user
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
