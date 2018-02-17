require 'spec_helper'
require_relative '../app/parking_lot'
require_relative '../app/single_vehicle_spot'
require_relative '../app/vehicle'

describe ParkingLot do
  describe '#find_parking_spot' do
    it 'finds a level and spot with availability' do
      spot = SingleVehicleSpot.new(10, 1)
      lot = ParkingLot.new([spot])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq spot
    end

    it 'finds the first level that has availability' do
      spot1 = SingleVehicleSpot.new(10, 1)
      spot1.available = false
      spot2 = SingleVehicleSpot.new(10, 2)
      spot3 = SingleVehicleSpot.new(10, 3)
      lot = ParkingLot.new([spot1, spot2, spot3])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq spot2
    end

    it 'returns a friendly message if there is no availability' do
      lot = ParkingLot.new([])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq 'Sorry, this parking lot is full'
    end

    it 'claims the available spot' do
      spot = SingleVehicleSpot.new(10, 1)
      allow(spot).to receive(:claim)
      lot = ParkingLot.new([spot])
      vehicle = Vehicle.new(10, 100)

      lot.find_parking_spot(vehicle)

      expect(spot).to have_received(:claim)
    end
  end
end

