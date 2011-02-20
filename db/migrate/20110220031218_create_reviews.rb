class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :venue_id
      t.integer :user_id
      t.boolean :active, :default => false
      t.integer :rating
      t.integer :wifi_rating
      t.string :wifi_notes
      t.integer :ambiance_rating
      t.string :ambiance_notes
      t.integer :table_availability_rating
      t.string :table_availability_notes
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
