class EmployeesController < ApplicationController
  def index
    @employees = Employee.where(department: "Boston Public Library")

    respond_to do |format|
      format.html
      format.json {render json: @employees, root: false }
    end
  end
end
