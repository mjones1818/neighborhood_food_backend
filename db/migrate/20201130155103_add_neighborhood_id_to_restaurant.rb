class AddNeighborhoodIdToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :neighborhood_id, :integer
  end
end
