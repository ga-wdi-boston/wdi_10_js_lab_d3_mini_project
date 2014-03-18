class RemoveDestinationCodeFromDelays < ActiveRecord::Migration
  def change
    remove_column :delays, :destination_code, :string
  end
end
