class EmployeesController < ApplicationController
  def index
    @employees = Employee.where(department: "Boston Public Library")
    render json: @employees, root: false
  end
end
