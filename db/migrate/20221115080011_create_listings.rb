class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :item_name, null: false
      t.text :item_description, null: false
      t.float :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
