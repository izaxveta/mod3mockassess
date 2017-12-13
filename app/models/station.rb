class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @fuel_types = data[:fuel_type_code]
    @distance = data[:distance]
    @access_times = data[:access_days_time]
  end

  def self.find_by_distance(location, distance)
    conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get("nearest.json?api_key=#{ENV['API_KEY']}&location=#{location}&fuel_type=ELEC&limit=10")
    station_data = JSON.parse(response.body, symbolize_names: true)
    station_data[:fuel_stations].map do |station|
      Station.new(station)
    end
  end
end