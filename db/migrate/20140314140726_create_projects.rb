class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.integer :funding, :limit => 8
      t.string :status
      t.float :percent_spent

      t.timestamps
    end
  end
end
