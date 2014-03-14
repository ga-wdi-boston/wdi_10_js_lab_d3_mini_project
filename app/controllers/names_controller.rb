class NamesController < ApplicationController
  def index
    @names = Name.all
    respond_to do |format|
    format.html
    format.json {render json: @names, root: false }
  end
end
