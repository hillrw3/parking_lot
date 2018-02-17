class ParkingLot
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def find_parking_spot(vehicle)
    levels.each do |level|
      return level if level.find_available_spot(vehicle)
    end
  end
end