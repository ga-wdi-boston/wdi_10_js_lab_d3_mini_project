class CountriesController < ApplicationController
  def assistance
  end

  def life_exp
    respond_to do |format|
      format.html
      format.json do
        @countries = Country.all.order(total_aid: :desc).limit(15)
        render json: @countries
      end
    end
  end

  def econ
    @countries = Country.all.order(econ_aid: :desc).limit(40)
    render json: @countries
  end

  def mil
    @countries = Country.all.order(mil_aid: :desc).limit(40)
    render json: @countries
  end
end
