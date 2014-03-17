class TownsController < ApplicationController
  def index
    # this returns the data for all towns which are not unique
    @towns = Town.select("name, count(state) as reps").group("name").having("COUNT(*) > 2").order("count(state) DESC")
    respond_to do |format|
      format.html
      format.json {render json: @towns }
    end
  end

  def top_towns
    # this returns only the towns which have at least 15 reps
    @top_towns = Town.select("name, count(state) as reps").group("name").having("COUNT(*) > 14").order("count(state) DESC")
    respond_to do |format|
      format.html
      format.json {render json: @top_towns }
    end
  end
end



# NOTES ON Queries
# Town.select("name, count(state) as rep").group("name").having("COUNT(*) > 1").order("count(state) DESC")
# Town.where(name: "Franklin").pluck(:state)
# SELECT DISTINCT(name), COUNT(name) FROM towns GROUP BY name;
# SELECT name, count(state) as reps FROM towns GROUP BY name HAVING COUNT(*) > 1 ORDER BY count(state) DESC;
