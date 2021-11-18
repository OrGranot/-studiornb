class AddPriceToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :price, :float
  end
end
