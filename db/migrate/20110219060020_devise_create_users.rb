class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.integer :city_id
      t.string :first_name
      t.string :last_name
      t.boolean :admin, :default => false

      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.text :biography
      t.string :website
      t.string :twitter
      t.string :linked_in
      t.string :github

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end
