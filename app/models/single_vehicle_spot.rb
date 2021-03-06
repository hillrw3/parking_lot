require_relative 'spot'

class SingleVehicleSpot < Spot
  attr_accessor :available
  attr_reader :size, :level, :occupant
  TYPE = :single_vehicle

  def initialize(size:, level: 1)
    super(size: size, level: level)
    @occupant = nil
  end

  def available?(vehicle)
    available && size >= vehicle.size
  end

  def claim(vehicle)
    self.available = false
    @occupant = vehicle
  end

  def type
    TYPE
  end
end