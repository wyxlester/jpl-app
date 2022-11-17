class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @listings = Listing.all
    @listings = @listings.last(5)
  end
end
