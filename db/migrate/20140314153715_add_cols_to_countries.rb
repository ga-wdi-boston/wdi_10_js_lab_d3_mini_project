class AddColsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :group, :string
    add_column :countries, :region, :string
    add_column :countries, :currency, :string
  end
end
