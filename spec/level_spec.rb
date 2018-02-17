require 'spec_helper'
require_relative '../app/level'
require_relative '../app/single_vehicle_spot'

describe Level do
  describe '#has_available_spot?' do
    it 'returns the first available spot' do
      spot1 = SingleVehicleSpot.new(10)
      allow(spot1).to receive(:available?) { false }
      spot2 = SingleVehicleSpot.new(10)
      allow(spot2).to receive(:available?) { true }
      level = Level.new([spot1, spot2])
      vehicle = Vehicle.new(5, 5)

      expect(level.find_available_spot(vehicle)).to eq spot2
    end

    it 'returns nil if there is no availability' do
      spot = SingleVehicleSpot.new(10)
      allow(spot).to receive(:available?) { false }

      level = Level.new([spot])
      vehicle = Vehicle.new(5, 5)

      expect(level.find_available_spot(vehicle)).to be nil
    end

    it 'claims the spot if there is availability' do
      spot = SingleVehicleSpot.new(10)
      allow(spot).to receive(:available?) { true }
      allow(spot).to receive(:claim)
      level = Level.new([spot])
      vehicle = Vehicle.new(5, 5)

      level.find_available_spot(vehicle)

      expect(spot).to have_received(:claim)
    end
  end
end