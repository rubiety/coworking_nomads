class CreateVenueSuggestions < ActiveRecord::Migration
  def self.up
    create_table :venue_suggestions do |t|
      t.references :user
      t.references :city
      t.string :name
      t.string :address
      t.timestamps
    end
  end

  def self.down
    drop_table :venue_suggestions
  end
end
