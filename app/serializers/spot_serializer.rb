require 'fast_jsonapi'
require_relative '../../app/models/single_vehicle_spot'
require_relative '../../app/models/multi_vehicle_spot'

class SingleSpotSerializer
  include FastJsonapi::ObjectSerializer

  set_type SingleVehicleSpot::TYPE
  attributes :id, :level, :size, :occupant
end

class MultiSpotSerializer
  include FastJsonapi::ObjectSerializer

  set_type MultiVehicleSpot::TYPE
  attributes :id, :level, :size, :occupants
end
