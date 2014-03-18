class DelaysController < ApplicationController
  def index
    @delays = Delay.all
    render json: @delays
  end
end
