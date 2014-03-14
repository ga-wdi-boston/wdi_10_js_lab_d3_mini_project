require "#{Rails.root}/lib/import/import_data"

namespace :import do
  desc "Import the flight data"
  task data: :environment do
    FlightData.data
  end
end
