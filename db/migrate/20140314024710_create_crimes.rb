class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.integer :survey_year
      t.integer :institution_size
      t.integer :murder
      t.integer :sex_offense
      t.integer :robbery
      t.integer :aggravated_assault
      t.integer :burglary
      t.integer :motor_theft
      t.integer :arson

      t.timestamps
    end
  end
end
