class AddEmailAndPasswordToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end
