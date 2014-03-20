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

end
