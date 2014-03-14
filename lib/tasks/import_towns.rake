require_relative "../import_towns_data"

namespace :import_towns do
  desc "Import my towns data"
  task town_data: :environment do
    ImportTowns.import
  end
end

# rake import_towns:town_data
