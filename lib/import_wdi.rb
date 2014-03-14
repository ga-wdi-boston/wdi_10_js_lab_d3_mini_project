require 'csv'


class ImportWdi
  def self.import_countries
    data = CSV.read("#{Rails.root}/data/WDI_Country.csv")
    data.each_with_index do |line, i|
      if i != 0
        Country.create!({
          name: line[1],
          code: line[0],
          group: line[2],
          region: line[3],
          currency: line[6]
          })
        puts "#{line[1]} imported!"
      end
    end
  end

  def self.import_wdi
    data = CSV.read("#{Rails.root}/data/WDI_Data.csv")
    array = []
    data.each_with_index do |line, i|


    end
  end
end


# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  group      :string(255)
#  region     :string(255)
#  currency   :string(255)
