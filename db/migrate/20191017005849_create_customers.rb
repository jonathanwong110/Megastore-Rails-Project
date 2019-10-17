class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :email
      t.email :password_digest

      t.timestamps
    end
  end
end
