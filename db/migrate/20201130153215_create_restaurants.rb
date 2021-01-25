class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :locality
      t.text :url
      t.integer :price_range
      t.integer :average_cost_for_two
      t.string :aggregate_rating
      t.integer :all_reviews_count

      t.timestamps
    end
  end
end
