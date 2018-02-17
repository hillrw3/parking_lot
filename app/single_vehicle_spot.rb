class SingleVehicleSpot
  attr_accessor :available
  attr_reader :size, :level

  def initialize(size, level=1)
    @size = size
    @level = level
    @available = true
  end

  def available?(vehicle)
    available && size >= vehicle.size
  end

  def claim
    self.available = false
  end
end