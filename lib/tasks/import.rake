require_relative '../import_wdi'

namespace :import do

  # Countries
  desc "import countries"
  task countries: :environment do
    ImportWdi.import_countries
  end

  desc "delete countries from db"
  task delete_countries: :environment do
    Country.delete_all
  end

  # WDI Data
  desc "import world dev indicators for countries"
  task wdi_data: :environment do
    ImportWdi.import_wdi
  end

  desc "delete all wdi data from db"
  task delete_wdi_data: :environment do
    Indicator.delete_all
    Year.delete_all
  end
end
