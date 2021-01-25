class AddCuisineIdToCuisines < ActiveRecord::Migration[6.0]
  def change
    add_column :cuisines, :cuisine_id, :integer
  end
end
