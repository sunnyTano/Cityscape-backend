class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :neighborhood
      t.string :borough
      t.string :name
      t.string :price
      t.integer :min_nights
      t.string :room_type
      t.string :image
      t.string :image_small
      t.string :amenitites
      t.string :description
      t.string :overview
      t.float :latitude
      t.float :longitude
      t.belongs_to :user

      t.timestamps
    end
  end
end
