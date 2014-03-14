require 'csv' #csv library that comes with Ruby
require 'names_data'

class ImportNamesData
  def self.import
    data = CSV.read("#{Rails.root}/data/names_data.csv")

    data.each do |row|
      row.compact!
      state_name = row[0].strip
      state_abbrev = STATES[state_name]
      puts "State row is #{row}"
      State.create!(name: row[0], pop_at_risk: row[1].gsub(/,/,'').to_i, reincarcerated: row[2].gsub(/,/,'').to_i, percent: row[3].to_f, abbreviation: state_abbrev)
    end
  end
end
