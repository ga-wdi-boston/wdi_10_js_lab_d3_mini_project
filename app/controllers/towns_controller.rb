class TownsController < ApplicationController
  def index
    # SELECT DISTINCT(name), COUNT(name) FROM towns GROUP BY name;
    # SELECT name, count(state) FROM towns GROUP BY name HAVING COUNT(*) > 1 ORDER BY count(state) DESC;
    binding.pry
    towns = Town.all.limit(1)
    respond_to do |format|
      format.html
      format.json {render json: towns, root: false }
    end
  end
end

Town.select("name, count(state) as rep").group("name").having("COUNT(*) > 1").order("count(state) DESC")


