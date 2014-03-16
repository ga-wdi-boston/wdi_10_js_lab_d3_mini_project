class MainController < ApplicationController
  def index
    @countries = Country.all
  end
end
