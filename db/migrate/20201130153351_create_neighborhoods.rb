class CreateNeighborhoods < ActiveRecord::Migration[6.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
