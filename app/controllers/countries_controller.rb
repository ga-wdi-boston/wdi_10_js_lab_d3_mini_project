class CountriesController < ApplicationController
  def index
    @world = Country.includes({years: :indicator}).find_by_code("WLD")
    render json: @world, root: false
  end

  def show
    @country = Country.includes({years: :indicator}).find(params[:id])
    render json: @country, root: false
  end
end
