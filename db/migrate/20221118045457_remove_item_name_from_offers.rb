class RemoveItemNameFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :item_name
  end
end
