class TownsController < ApplicationController
  def index
    towns = Town.all
    respond_to do |format|
      format.html
      format.json {render json: towns, root: false }
    end
  end
end
