require 'csv'


class ImportWdi
  def self.import
    data = CSV.read("#{Rails.root}/data/small_set.csv")
    array = []
    data.each_with_index do |line, i|
      if i < 10
        puts line.inspect
        false
      end
      # line[0] = country
      # line[1] = country_code
      # line[2] = indicator_name
      # line[3] = indicator_code
      # line[4..57] dates between 1960 and current

    end
  end
end
