class SearchController < ApplicationController
  def index
    @stations = Station.find_by_location(params[:q], 6)
  end
end