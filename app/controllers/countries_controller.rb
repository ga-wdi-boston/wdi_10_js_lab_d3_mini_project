class CountriesController < ApplicationController
  def index
    @world = Country.includes({years: :indicator}).find_by_code("WLD")
    render json: @world, root: false
  end
end
