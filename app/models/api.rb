class Api
  APIID= '00328c95831e76b0eb4108eced3ceb89'

  def self.search(params)
    uri = URI.parse("https://developers.zomato.com/api/v2.1/search?entity_id=#{params[:entity_id]}&entity_type=subzone&count=100&cuisines=#{array_to_url(params[:cuisine_id])}&sort=rating&order=desc")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["User-Key"] = APIID

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    JSON.parse(response.body)["restaurants"] #.first["restaurant"]
  end

  def self.neighborhood_request(neighborhood)
    uri = URI.parse("https://developers.zomato.com/api/v2.1/locations?query=#{string_to_url(neighborhood)}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["User-Key"] = APIID
    
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    
    # response.code
    JSON.parse(response.body)["location_suggestions"].first
  end

  def self.cuisine_request(city_id=292)

    uri = URI.parse("https://developers.zomato.com/api/v2.1/cuisines?city_id=#{city_id.to_s}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["User-Key"] = APIID

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    # response.code
    JSON.parse(response.body)["cuisines"]
  end

  def self.city_request(city)

    uri = URI.parse("https://developers.zomato.com/api/v2.1/cities?q=#{string_to_url(city)}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/json"
    request["User-Key"] = APIID

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    # response.code
    JSON.parse(response.body)["location_suggestions"]
  end

  def self.array_to_url(array)
    if array.kind_of?(Array)
      array.join("%2C")
    else
      return array
    end
  end 

  def self.string_to_url(string)
    string.gsub(" ", "%20")
  end 
end