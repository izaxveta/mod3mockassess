class Station

  def self.find_by_distance(distance)
    conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/v1/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get("nearest.json?api_key=#{ENV['API_KEY']}&location= ?fuel_type=ELEC")
    # stations = JSON.parse(response.body, symbolize_names: true)

  end
end