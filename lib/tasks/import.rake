require_relative '../import_data.rb'
namespace :import do
  desc 'Import .csv data'

  task us_foreign_assistance: :environment do
    PrescottImport.import_assistance
  end

end
