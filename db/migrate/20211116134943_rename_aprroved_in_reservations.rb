class RenameAprrovedInReservations < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :aprroved, :approved
  end
end
