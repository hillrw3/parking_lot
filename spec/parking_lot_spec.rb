require 'spec_helper'
require_relative '../app/parking_lot'
require_relative '../app/level'
require_relative '../app/spot'
require_relative '../app/vehicle'

describe ParkingLot do
  it 'finds a level with availability' do
    spot = Spot.new(10)
    level = Level.new([spot])
    lot = ParkingLot.new([level])
    vehicle = Vehicle.new(10, 100)

    available_level = lot.find_parking_spot(vehicle)

    expect(available_level).to eq level
  end

  it 'finds the first level that has availability' do
    spot = Spot.new(10)
    level1 = Level.new([])
    level2 = Level.new([spot])
    level3 = Level.new([spot])
    lot = ParkingLot.new([level1, level2, level3])
    vehicle = Vehicle.new(10, 100)

    available_level = lot.find_parking_spot(vehicle)

    expect(available_level).to eq level2
  end
end

