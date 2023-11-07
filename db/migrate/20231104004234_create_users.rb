class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :logged, default: false

      t.timestamps
    end
  end
end
