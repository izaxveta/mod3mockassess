class SearchController < ApplicationController
  def index
    @stations = Station.find_by_distance(6)
  end
end