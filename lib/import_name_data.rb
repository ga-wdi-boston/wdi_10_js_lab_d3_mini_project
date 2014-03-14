require 'csv' #csv library that comes with Ruby

class ImportNamesData
  def self.import
    data = CSV.read("#{Rails.root}/data/names_data.csv")

    data.each do |row|
      Name.create!(birthyear: row[0], gender: row[1], ethnicity: row[2], name: row[3], count: row[4], rank: row[5])
    end
  end
end
