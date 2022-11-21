class RemoveStatusColumnFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :status
  end
end
