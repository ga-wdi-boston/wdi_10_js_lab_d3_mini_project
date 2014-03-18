class RemoveArrivalDelayFromDelays < ActiveRecord::Migration
  def change
    remove_column :delays, :arrival_delay, :integer
  end
end
