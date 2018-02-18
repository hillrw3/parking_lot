require_relative '../app/models/parking_lot'
require_relative '../app/models/single_vehicle_spot'
require_relative '../app/models/multi_vehicle_spot'

class DB
  def self.create_spots
    levels = ENV['LEVELS'] ? ENV['LEVELS'].to_i : 1
    single_vehicle_spots = ENV['SINGLE_VEHICLE_SPOTS'] ? ENV['SINGLE_VEHICLE_SPOTS'].to_i : 10
    multi_vehicle_spots = ENV['MULTI_VEHICLE_SPOTS'] ? ENV['MULTI_VEHICLE_SPOTS'].to_i : 1
    spots = []

    levels.times do |level_index|
      single_vehicle_spots.times do |spot_index|
        spots << SingleVehicleSpot.new(size: rand(50).to_i, level: level_index, id: spot_index)
      end

      multi_vehicle_spots.times do |spot_index|
        spots << MultiVehicleSpot.new(level: level_index, id: spot_index)
      end
    end

    spots
  end

  def self.lot
    @lot ||= ParkingLot.new(self.create_spots)
  end
end
