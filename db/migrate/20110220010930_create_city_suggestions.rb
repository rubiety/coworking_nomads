class CreateCitySuggestions < ActiveRecord::Migration
  def self.up
    create_table :city_suggestions do |t|
      t.string :name
      t.string :from_name
      t.string :from_email
      t.timestamps
    end
  end

  def self.down
    drop_table :city_suggestions
  end
end
