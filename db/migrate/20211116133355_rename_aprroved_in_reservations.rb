class RenameAprrovedInReservations < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :aproved, :approved
  end
end
