class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :name
      t.text :department
      t.integer :total_salary
      t.integer :regular_pay
      t.integer :overtime_pay
      t.integer :injury_pay
      t.integer :zipcode

      t.timestamps
    end
  end
end
