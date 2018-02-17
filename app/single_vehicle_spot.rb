require_relative 'spot'

class SingleVehicleSpot < Spot
  attr_accessor :available
  attr_reader :size, :level
  TYPE = :single_vehicle

  def initialize(size:, level: 1)
    super(size: size, level: level)
  end

  def available?(vehicle)
    available && size >= vehicle.size
  end

  def type
    TYPE
  end
end