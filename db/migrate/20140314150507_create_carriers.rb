class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :carrier_code
      t.string :origin_code
      t.string :destination_code

      t.timestamps
    end
  end
end
