class ChangeLocationToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :studios, :location, :address
  end
end
