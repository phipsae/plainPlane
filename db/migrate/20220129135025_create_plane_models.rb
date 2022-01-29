class CreatePlaneModels < ActiveRecord::Migration[6.0]
  def change
    create_table :plane_models do |t|
      t.integer :seats
      t.integer :horsepower
      t.string :model_name

      t.timestamps
    end
  end
end
