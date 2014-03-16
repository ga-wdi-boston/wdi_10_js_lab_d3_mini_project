class ChangeDataTypeForValue < ActiveRecord::Migration
  def change
    change_column :years, :value, :float
  end
end
