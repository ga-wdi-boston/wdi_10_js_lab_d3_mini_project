class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.references :country, index: true
      t.references :indicator, index: true
      t.decimal :value
      t.integer :name

      t.timestamps
    end
  end
end
