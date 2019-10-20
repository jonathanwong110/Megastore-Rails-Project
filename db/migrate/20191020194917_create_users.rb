class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :string
      t.string :password_digest
      t.boolean :store, default: false

      t.timestamps
    end
  end
end
