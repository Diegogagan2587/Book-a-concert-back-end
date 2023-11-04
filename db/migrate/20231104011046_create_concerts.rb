class CreateConcerts < ActiveRecord::Migration[7.1]
  def change
    create_table :concerts do |t|
      t.string :title
      t.references :organizer, null: false, foreign_key: true
      t.text :description
      t.string :img
      t.decimal :price, precision: 9, scale: 2
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
