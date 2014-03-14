require 'csv'
#  the root of your current project is the Rails.root
class ImportTowns
  def self.import
    data = CSV.read("#{Rails.root}/data/statecity.csv")
    data.each do |row|
      Town.create!(name: row[2],
        state: row[0],
        longitude: row[7],
        latitude: row[6])
    end
  end
end
