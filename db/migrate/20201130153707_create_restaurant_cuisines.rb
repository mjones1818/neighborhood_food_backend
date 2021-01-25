class CreateRestaurantCuisines < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_cuisines do |t|
      t.integer :restaurant_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
