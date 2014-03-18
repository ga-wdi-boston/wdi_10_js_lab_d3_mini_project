class RemoveOriginCodeFromDelays < ActiveRecord::Migration
  def change
    remove_column :delays, :origin_code, :string
  end
end
