class CountriesController < ApplicationController
  def index
    @countries = Country.includes({years: :indicator})
    render json: @countries, root: false
  end

  def show
    @country = Country.includes({years: :indicator}).find(params[:id])
    render json: @country, root: false
  end
end
