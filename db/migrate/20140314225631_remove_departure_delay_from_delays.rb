class RemoveDepartureDelayFromDelays < ActiveRecord::Migration
  def change
    remove_column :delays, :departure_delay, :integer
  end
end
