class AddMissingIndexes < ActiveRecord::Migration
  def self.up
    add_index :check_ins, :venue_id
    add_index :check_ins, :user_id

    add_index :reviews, :venue_id
    add_index :reviews, :user_id

    add_index :users, :city_id

    add_index :venue_suggestions, :user_id
    add_index :venue_suggestions, :city_id

    add_index :venues, :city_id
  end

  def self.down
    remove_index :check_ins, :venue_id
    remove_index :check_ins, :user_id

    remove_index :reviews, :venue_id
    remove_index :reviews, :user_id

    remove_index :users, :city_id

    remove_index :venue_suggestions, :user_id
    remove_index :venue_suggestions, :city_id

    remove_index :venues, :city_id
  end
end
