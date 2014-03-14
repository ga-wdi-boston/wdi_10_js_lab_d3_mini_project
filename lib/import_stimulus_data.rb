require 'csv'

class ImportStimulus
  #Import the stimulus data
  def self.import
    file = File.open("#{Rails.root}/data/Federal_Stimulus_Data.csv", encoding: "iso-8859-1:UTF-8")
    data = CSV.parse(file)
    data.each do |row|
      binding.pry
    end
  end
end
