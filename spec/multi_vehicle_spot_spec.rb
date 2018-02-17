require 'spec_helper'
require_relative '../app/multi_vehicle_spot'

describe MultiVehicleSpot do
  describe '#fill_spot' do
    it 'allows a total size of 50' do
      vehicle1 = Vehicle.new(20, 120)
      vehicle2 = Vehicle.new(20, 110)
      vehicle3 = Vehicle.new(20, 100)
      vehicle4 = Vehicle.new(10, 100)

      spot = MultiVehicleSpot.new

      expect(spot.fill([vehicle1, vehicle2, vehicle3, vehicle4])).to match_array([vehicle1, vehicle2, vehicle4])
    end

    it 'maximizes profits' do
      dodge = Vehicle.new(15, 50)
      jaguar = Vehicle.new(45, 170)
      mercedes = Vehicle.new(10, 100)
      audi = Vehicle.new(20, 30)

      spot = MultiVehicleSpot.new

      expect(spot.fill([dodge, jaguar, mercedes, audi])).to match_array([dodge, mercedes, audi])
    end

    it 'handles when all vehicles fit' do
      dodge = Vehicle.new(15, 50)
      mercedes = Vehicle.new(10, 100)
      audi = Vehicle.new(20, 30)

      spot = MultiVehicleSpot.new

      expect(spot.fill([dodge, mercedes, audi])).to match_array([dodge, mercedes, audi])
    end
  end
end