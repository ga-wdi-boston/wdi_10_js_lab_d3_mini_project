class CreateTown < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name, index: true
      t.string :state, index: true
      t.float :latitude
      t.float :longitude
    end
  end
end


