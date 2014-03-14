class CreateDelays < ActiveRecord::Migration
  def change
    create_table :delays do |t|
      t.integer :day_of_week
      t.references :carrier, index: true
      t.integer :arrival_delay
      t.integer :departure_delay
      t.integer :year

      t.timestamps
    end
  end
end
