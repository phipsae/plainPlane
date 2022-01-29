class RenameModelNameToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :plane_models, :model_name, :name
  end
end
