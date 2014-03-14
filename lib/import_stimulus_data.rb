require 'csv'

class ImportStimulus
  #Import the stimulus data
  def self.import
    file = File.open("#{Rails.root}/data/Federal_Stimulus_Data.csv", encoding: "iso-8859-1:UTF-8")
    data = CSV.parse(file)
    data.each do |row|
      if row[0] != 'Project Name'
        if Project.find_by(name: row[0]) == nil && row[5].to_i != 0
          Project.create!(name: row[0], category: row[3], funding: row[5].to_i, status: row[10], percent_spent: row[11].to_f)
        end
      end
    end
  end
end
