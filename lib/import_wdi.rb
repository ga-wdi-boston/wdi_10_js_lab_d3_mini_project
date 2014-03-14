require 'csv'


class ImportWdi
  def self.import_countries
    data = CSV.read("#{Rails.root}/data/WDI_Country.csv")
    data.each_with_index do |line, i|
      if i != 0
        Country.create!({
          name: line[1],
          code: line[0],
          group: line[2],
          region: line[3],
          currency: line[6]
          })
        puts "#{line[1]} imported!"
      end
    end
  end

  def self.import_wdi
    data = CSV.read("#{Rails.root}/data/WDI_Data.csv")
    years = [1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013]
    indicators = ["SP.POP.TOTL", "IT.NET.USER.P2","IT.NET.BBND", "IT.NET.BBND.P2", "IT.CEL.SETS", "IT.CEL.SETS.P2"]

    data.each_with_index do |line, i|
      if i !=0
        country = Country.find_by_code(line[1])

        if indicators.include?(line[3])
          indicator = Indicator.find_by_code(line[3]) || Indicator.create!({
              name: line[2],
              code: line[3]
              })
          years.each_with_index do |year, i|
            Year.create({
              country: country,
              indicator: indicator,
              name: year,
              value: line[i + 4]
              })
          end
          puts "#{indicator.name} imported for #{country.name}."
        end
      end
    end
  end
end


# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  group      :string(255)
#  region     :string(255)
#  currency   :string(255)

#["Country Name", "Country Code", "Indicator Name", "Indicator Code", "1960", "1961", "1962", "1963", "1964", "1965", "1966", "1967", "1968", "1969", "1970", "1971", "1972", "1973", "1974", "1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013"]
