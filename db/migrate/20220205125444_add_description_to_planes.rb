class AddDescriptionToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :description, :text
  end
end
