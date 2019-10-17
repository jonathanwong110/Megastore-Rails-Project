class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :username
      t.string :email
      t.email :password_digest

      t.timestamps
    end
  end
end
