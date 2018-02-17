require 'spec_helper'
require_relative '../app/level'
require_relative '../app/spot'

describe Level do
  describe '#has_available_spot?' do
    it 'returns true if level has a spot that is available that fits the vehicle' do
      spot = Spot.new(10)
      level = Level.new([spot])
      vehicle = Vehicle.new(5, 5)

      expect(level.find_available_spot(vehicle)).to be true
    end

    it 'returns false if all spots are filled' do
      spot = Spot.new(10)
      spot.available = false
      level = Level.new([spot])
      vehicle = Vehicle.new(5, 5)

      expect(level.find_available_spot(vehicle)).to be false
    end

    it 'returns false if all open spots are too small' do
      spot1 = Spot.new(10)
      spot2 = Spot.new(15)
      level = Level.new([spot1, spot2])
      vehicle = Vehicle.new(20, 5)

      expect(level.find_available_spot(vehicle)).to be false
    end
  end
end