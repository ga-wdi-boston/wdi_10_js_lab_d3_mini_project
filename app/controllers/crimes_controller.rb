class CrimesController < ApplicationController
  def index
    crimes = Crimecompact.all
    respond_to do |format|
      format.html
      format.json {render json: crimes, root: false}
    end
  end
end
