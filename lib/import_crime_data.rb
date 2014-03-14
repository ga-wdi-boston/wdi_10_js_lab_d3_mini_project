require 'csv'

class ImportCrime
  def self.import
    data = CSV.read("#{Rails.root}/data/Criminal_Offenses_On_campus.csv")
    data.each do |row|
      if row[0].to_i >= 2001 && row[0].to_i <= 2012
        Crime.create!(survey_year: row[0].to_i, institution_size: ((row[5].nil?) ? row[5] : 0).to_i, murder: (row[6].to_i + row[7].to_i), sex_offense: (row[8].to_i + row[9].to_i), robbery: row[10].to_i, aggravated_assault: row[11].to_i, burglary: row[12].to_i, motor_theft: row[13].to_i, arson: row[14].to_i)
      end
    end
  end

  def self.handle
    i = 2001
    while i <= 2012
      crimes = Crime.find_all_by_survey_year(i)
      count = Crime.find_all_by_survey_year(i).count
      murder = 0
      sex_offense = 0
      robbery = 0
      aggravated_assault = 0
      burglary = 0
      motor_theft = 0
      arson = 0
      crimes.each do |crime|
        murder += crime.murder
        sex_offense += crime.sex_offense
        robbery += crime.robbery
        aggravated_assault += crime.aggravated_assault
        burglary += crime.burglary
        motor_theft += crime.motor_theft
        arson += crime.arson
      end

      Crimecompact.create!(survey_year: i, murder_total: murder, sex_offense_total: sex_offense, robbery_total: robbery, aggravated_assault_total: aggravated_assault, burglary_total: burglary, motor_theft_total: motor_theft, arson_total: arson, count: count)
      i = i + 1
    end
  end
end
