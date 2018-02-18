require 'spec_helper'
require_relative '../app/models/parking_lot'
require_relative '../app/models/single_vehicle_spot'
require_relative '../app/models/multi_vehicle_spot'
require_relative '../app/models/vehicle'

describe ParkingLot do
  describe '#find_parking_spot' do
    it 'finds a single vehicle spot with availability' do
      multi_vehicle_spot = MultiVehicleSpot.new(size: 10, level: 1)
      single_vehicle_spot = SingleVehicleSpot.new(size: 10, level: 1)
      lot = ParkingLot.new([multi_vehicle_spot, single_vehicle_spot])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq single_vehicle_spot
    end

    it 'finds the first level that has availability' do
      spot1 = SingleVehicleSpot.new(size: 10, level: 1)
      spot1.available = false
      spot2 = SingleVehicleSpot.new(size: 10, level: 2)
      spot3 = SingleVehicleSpot.new(size: 10, level: 3)
      lot = ParkingLot.new([spot1, spot2, spot3])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq spot2
    end

    it 'returns a friendly message if there is no availability' do
      lot = ParkingLot.new([])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq ParkingLot::LOT_FULL_MESSAGE
    end

    it 'claims the available spot' do
      spot = SingleVehicleSpot.new(size: 10)
      allow(spot).to receive(:claim)
      lot = ParkingLot.new([spot])
      vehicle = Vehicle.new(10, 100)

      lot.find_parking_spot(vehicle)

      expect(spot).to have_received(:claim)
    end
  end

  describe '#fill_multi_vehicle_parking_spot' do
    it 'assigns the multivehicle spot on the lowest level' do
      single_vehicle_spot = SingleVehicleSpot.new(size: 10, level: 1)
      multi_vehicle_spot1 = MultiVehicleSpot.new(size: 10, level: 1)
      multi_vehicle_spot2 = MultiVehicleSpot.new(size: 10, level: 2)
      lot = ParkingLot.new([single_vehicle_spot, multi_vehicle_spot2, multi_vehicle_spot1])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.fill_multi_vehicle_parking_spot([vehicle, vehicle])

      expect(available_spot).to eq multi_vehicle_spot1
    end

    it 'claims the available spot' do
      spot = MultiVehicleSpot.new(size: 10)
      allow(spot).to receive(:claim)
      lot = ParkingLot.new([spot])
      vehicle = Vehicle.new(10, 100)

      lot.fill_multi_vehicle_parking_spot([vehicle])

      expect(spot).to have_received(:claim)
    end

    it 'returns a friendly message if there is no availability' do
      lot = ParkingLot.new([])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.fill_multi_vehicle_parking_spot([vehicle])

      expect(available_spot).to eq ParkingLot::LOT_FULL_MESSAGE
    end
  end
end

