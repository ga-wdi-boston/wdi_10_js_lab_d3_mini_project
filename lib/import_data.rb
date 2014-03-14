require 'csv'

class PrescottImport
  def self.import_assistance
    data = CSV.read("#{Rails.root}/data/us_foreign_assistance_edited.csv")

    # Get an array of country names
    countries = []
    data.each do |row|
      countries.push(row[1])
    end
    countries.uniq!.each do |country|
      Country.create!(name: country)
    end

    # Make assistances for each row and assign them to countries
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

    # Update countries total aid received
    Country.all.each do |country|
      economic = military = 0
      assitances = Assistance.where(country: country)
      assitances.each do |assistance|
        assistance.assist_type == "Economic" ?
          economic += assistance.amount : military += assistance.amount
      end
      country.update!(econ_aid: economic, mil_aid: military, total_aid:
        economic + military)
    end
  end

  def self.import_life_exp
    data = CSV.read("#{Rails.root}/data/life_expectancy.csv")

    data.each do |row|
      country = Country.find_by_name(row[0])
      if country.present?
        country.update(life_expectancy: row[1])
      end
    end
  end
end
