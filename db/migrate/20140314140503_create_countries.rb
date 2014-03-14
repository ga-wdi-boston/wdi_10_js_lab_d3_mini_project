class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.text :name
      t.column :econ_aid, :bigint
      t.column :mil_aid, :bigint
      t.column :total_aid, :bigint
      t.integer :life_expectancy
      t.timestamps
    end
  end
end
