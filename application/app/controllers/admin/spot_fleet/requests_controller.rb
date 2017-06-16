class Admin::SpotFleet::RequestsController < ApplicationController
  def index
    client = SpotFleetRequest::Client.new
    requests = client.describe
    @configs = requests.spot_fleet_request_configs.map do |config|
      config_data = config.spot_fleet_request_config
      spot_instance = SpotFleetRequest::SpotInstance.new
      request_config = SpotFleetRequest::RequestConfig.new(spot_instance)
    end
  end
end
