require_relative "../import_stimulus_data"
namespace :import do
  desc "Import federal stimulus data"
  task stimulus_data: :environment do
    ImportStimulus.import
  end

end
