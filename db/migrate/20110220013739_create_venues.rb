class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.references :city
      t.string :name
      t.boolean :active, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
