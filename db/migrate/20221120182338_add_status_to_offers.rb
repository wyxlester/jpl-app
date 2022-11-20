class AddStatusToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :status, :boolean, default: false
  end
end
