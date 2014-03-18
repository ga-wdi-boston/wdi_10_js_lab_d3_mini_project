class CarriersController < ApplicationController

  def index
    @carriers = Carrier.all

    respond_to do |format|
      format.html
      format.json { render json: @carriers, root: false}
    end
  end

  def show
    @carrier = Carrier.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @carrier, root: false}
    end
  end

end
