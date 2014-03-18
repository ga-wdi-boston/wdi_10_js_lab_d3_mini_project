class RemoveYearFromDelays < ActiveRecord::Migration
  def change
    remove_column :delays, :year, :integer
  end
end
