class SingleVehicleSpot
  attr_accessor :available
  attr_reader :size

  def initialize(size)
    @size = size
    @available = true
  end

  def available?(vehicle)
    available && size >= vehicle.size
  end

  def claim
    self.available = false
  end
end