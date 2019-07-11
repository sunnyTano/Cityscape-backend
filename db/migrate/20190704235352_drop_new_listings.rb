class DropNewListings < ActiveRecord::Migration[5.2]
  def change
    drop_table :new_listings do |t|
      t.belongs_to :user
      t.string :image
      t.string :location
      t.string :description
      t.string :price
      t.string :min_night
      t.timestamps
  end
end
end
