require 'spec_helper'
require_relative '../app/spot'
require_relative '../app/vehicle'

describe Spot do
  describe '#available?' do
    it 'returns true if available and size >= vehicle size' do
      spot = Spot.new(10)
      vehicle = Vehicle.new(5, 5)

      expect(spot.available?(vehicle)).to be true
    end

    it 'returns false available is false' do
      spot = Spot.new(10)
      spot.available = false
      vehicle = Vehicle.new(5, 5)

      expect(spot.available?(vehicle)).to be false
    end

    it 'returns false if size < vehicle size' do
      spot = Spot.new(10)
      vehicle = Vehicle.new(20, 5)

      expect(spot.available?(vehicle)).to be false
    end
  end
end