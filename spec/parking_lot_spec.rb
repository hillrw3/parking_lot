require 'spec_helper'
require_relative '../app/parking_lot'
require_relative '../app/level'
require_relative '../app/spot'
require_relative '../app/vehicle'

describe ParkingLot do
  describe '#find_parking_spot' do
    it 'finds a level and spot with availability' do
      spot = Spot.new(10)
      level = Level.new([spot])
      lot = ParkingLot.new([level])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq [level, spot]
    end

    it 'finds the first level that has availability' do
      spot = Spot.new(10)
      level1 = Level.new([])
      level2 = Level.new([spot])
      level3 = Level.new([spot])
      lot = ParkingLot.new([level1, level2, level3])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq [level2, spot]
    end

    it 'returns a friendly message if there is no availability' do
      lot = ParkingLot.new([])
      vehicle = Vehicle.new(10, 100)

      available_spot = lot.find_parking_spot(vehicle)

      expect(available_spot).to eq 'Sorry, this parking lot is full'
    end
  end
end

