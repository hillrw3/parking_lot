require 'sinatra'
require_relative 'models/vehicle'
require_relative 'serializers/parking_lot_serializer'
require_relative 'serializers/spot_serializer'
require_relative '../util/db'

get '/' do
  ParkingLotSerializer.new(DB.lot).serialized_json
end

put '/find_parking_spot' do
  vehicle = Vehicle.new(vehicle_params['size'], vehicle_params['cost'])

  spot = DB.lot.find_parking_spot(vehicle)
  SingleSpotSerializer.new(spot).serialized_json
end

put '/fill_multi_vehicle_parking_spot' do
  vehicles = vehicles_params.map do |vehicle|
    Vehicle.new(vehicle['size'], vehicle['cost'])
  end

  spot = DB.lot.fill_multi_vehicle_parking_spot(vehicles)
  MultiSpotSerializer.new(spot).serialized_json
end

private

def vehicle_params
  @vehicle_params ||= JSON.parse(request.body.read)['vehicle']
end

def vehicles_params
  @vehicles_params ||= JSON.parse(request.body.read)['vehicles']
end
