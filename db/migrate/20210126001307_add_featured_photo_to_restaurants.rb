class AddFeaturedPhotoToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :featured_image, :string
  end
end
