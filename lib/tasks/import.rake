require "#{Rails.root}/lib/import/import_employees.rb"

namespace :import do
  desc "Import the Boston salaries data"
  task employees: :environment do
    ImportEmployees.import
  end

end
