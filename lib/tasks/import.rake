require_relative "../import_name_data"

namespace :import do
  desc "Import 2011 NYC baby name data"
  task baby_name_data: :environment do
    ImportNamesData.import
  end
end
