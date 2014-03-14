require 'csv'

class FlightData
  def self.data
    all_carrier_codes = {}

    data = CSV.foreach("#{Rails.root}/data/1987.csv") do  |row|
      if row[0] != "Year"
        carrier_code = row[8]
        unless all_carrier_codes.keys.include?(carrier_code)
          id = Carrier.create!(carrier_code: carrier_code).id
          all_carrier_codes[carrier_code] = id
        end

        arrival_delay = row[14] == 'NA' ? -1 : row[14]
        departure_delay = row[15] == 'NA' ? -1 : row[15]

      raw_sql_insert = "INSERT INTO delays (arrival_delay, carrier_id, day_of_week, departure_delay, year) VALUES (#{arrival_delay}, #{all_carrier_codes[carrier_code]}, #{row[3]}, #{departure_delay}, #{row[0]})"
      ActiveRecord::Base.connection.execute(raw_sql_insert)

      end
    end
  end
end

