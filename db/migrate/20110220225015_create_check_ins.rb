class CreateCheckIns < ActiveRecord::Migration
  def self.up
    create_table :check_ins do |t|
      t.references :venue
      t.references :user
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :check_ins
  end
end
