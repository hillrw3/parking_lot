require 'fast_jsonapi'

class ParkingLotSerializer
  include FastJsonapi::ObjectSerializer

  attributes :spots
end