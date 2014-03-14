class CreateTown < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.string :state
      t.float :latitude
      t.float :longitude
    end
  end
end


