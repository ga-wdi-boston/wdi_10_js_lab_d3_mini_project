class CreateCrimecompacts < ActiveRecord::Migration
  def change
    create_table :crimecompacts do |t|
      t.integer :survey_year
      t.integer :murder_total
      t.integer :sex_offense_total
      t.integer :robbery_total
      t.integer :aggravated_assault_total
      t.integer :burglary_total
      t.integer :motor_theft_total
      t.integer :arson_total
      t.integer :count

      t.timestamps
    end
  end
end
