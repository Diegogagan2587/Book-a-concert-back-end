class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
