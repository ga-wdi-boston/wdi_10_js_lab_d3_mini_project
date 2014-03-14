require 'csv'

class PrescottImport
  def self.import_assistance
    data = CSV.read("#{Rails.root}/data/us_foreign_assistance_edited.csv")

    # Get an array of country names
    countries = []
    data.each do |row|
      countries.push(row[1])
    end
    countries.uniq.each do |country|
      Country.create!(name: country)
    end

    data.each do |row|
      country = Country.find_by_name(row[1])
      assistance = {
        country:     country,
        assist_type: row[0],
        program:     row[2],
        year:        row[3],
        amount:      row[4]
      }
      Assistance.create!(assistance)
    end

  end
end
