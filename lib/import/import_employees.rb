class ImportEmployees

  # class method, so use self.method_name
  def self.import
    file = File.read("#{Rails.root}/app/assets/data/boston_salaries.json")
    all_data = JSON.parse(file)
    meta_data = all_data["meta"]
    employee_data = all_data["data"]

    # employee_data is a bunch of arrays, where each array contains:
      # 8 - name
      # 9 - position
      # 10 - department
      # 11 - regular pay
      # 12 - retroactive pay
      # 13 - other pay
      # 14 - overtime pay
      # 15 - injured pay
      # 16 - detail
      # 17 - quinn
      # 18 - total salary
      # 19 - zip code of residence

    # this works, and probably takes about 5 minutes to import
    # employee_data.each do |employee|
    #   Employee.create!(
    #     name: employee[8].to_s,
    #     department: employee[10].to_s,
    #     total_salary: employee[18].to_i,
    #     regular_pay: employee[11].to_i,
    #     overtime_pay: employee[14].to_i,
    #     injury_pay: employee[15].to_i,
    #     zipcode: employee[19].gsub(/-..../, '')) # make zip only 5 digits

    #   puts "Imported #{employee.inspect}"
    # end

    # this works, and takes about 1 minute to import
    employee_data.each do |employee|

      # escape the fucking apostrophes
      name = employee[8].gsub(/'/,"''").gsub(/,/,', ').strip.to_s
      department = employee[10].strip.gsub(/'/,"''").to_s
      total_salary = employee[18].strip.to_i
      regular_pay = employee[11].strip.to_i
      overtime_pay = employee[14].strip.to_i
      injury_pay = employee[15].strip.to_i
      zipcode = employee[19].strip.gsub(/-..../,'').gsub(/UNKNOWN/,'00000').to_i

      raw_sql =
        "INSERT INTO employees (
          name,
          department,
          total_salary,
          regular_pay,
          overtime_pay,
          injury_pay,
          zipcode)
        VALUES (
          \'#{name}\',
          \'#{department}\',
          \'#{total_salary}\',
          \'#{regular_pay}\',
          \'#{overtime_pay}\',
          \'#{injury_pay}\',
          \'#{zipcode}\'
        )"

        ActiveRecord::Base.connection.execute(raw_sql)

        puts "Imported #{name}"

    end

  end

  #####################################


  def self.import_recidivism
    data =  CSV.read("#{Rails.root}/data/ppus07st06.csv")

    data.each do |row|
      state_name = row[1]

      if STATE_NAMES.include?(state_name)
        state_reciv =  StateRecividism.create!(name: state_name, pop_at_risk: row[3], returned_to_jail: row[4], percent: row[5])

        puts "Added #{state_reciv.inspect}"
        # puts "name: #{row[1]}, pop_at_risk: #{row[3]}, returned_to_jail: #{row[4]}, percentage: #{row[5]},  calc_percent = #{(row[4].to_f/row[3].to_f)*100}"
      end

    end

  end
end
