require_relative "../import_crime_data"

namespace :import do
  desc "clear data"
  task clear_crime: :environment do
    Crime.delete_all
  end
end

namespace :import do
  desc "create crimes"
  task import_crime: :environment do
    ImportCrime.import
  end

end

namespace :import do
  desc "handle to create compact"
  task compact_crime: :environment do
    ImportCrime.handle
  end
end

namespace :import do
  desc "clear data"
  task clear_compact_crime: :environment do
    Crimecompact.delete_all
  end
end
