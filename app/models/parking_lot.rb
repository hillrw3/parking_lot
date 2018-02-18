require 'securerandom'

class ParkingLot
  attr_reader :spots, :id
  LOT_FULL_MESSAGE = 'Sorry, this parking lot is full'

  def initialize(spots)
    @spots = spots.sort_by(&:level)
    @id = SecureRandom.hex(3)
  end

  def find_parking_spot(vehicle)
    single_vehicle_spots.each do |spot|
      if spot.available?(vehicle)
        spot.claim(vehicle)
        return spot
      end
    end

    LOT_FULL_MESSAGE
  end

  def fill_multi_vehicle_parking_spot(vehicles)
    multi_vehicle_spots.each do |spot|
      if spot.available?
        spot.claim(vehicles)
        return spot
      end
    end

    LOT_FULL_MESSAGE
  end

  private

  def single_vehicle_spots
    @single_vehicle_spots ||= spots.select {|spot| spot.type == SingleVehicleSpot::TYPE}
  end

  def multi_vehicle_spots
    @multi_vehicle_spots ||= spots.select {|spot| spot.type == MultiVehicleSpot::TYPE}
  end
end