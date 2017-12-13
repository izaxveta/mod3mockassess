class SearchController < ApplicationController
  def index
    @stations = Station.find_by_distance(80203, 6)
  end
end