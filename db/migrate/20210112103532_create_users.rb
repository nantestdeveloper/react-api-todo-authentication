class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.boolean :is_admin
      t.string :role_type

      t.timestamps
    end
  end
end
