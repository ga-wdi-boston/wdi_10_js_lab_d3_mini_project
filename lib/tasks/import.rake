require_relative '../import_wdi'

namespace :import do
  desc "imports wdi data from the data directory"
  task wdi_data: :environment do
    ImportWdi.import
  end

end
