class ParkingLot
  attr_reader :levels

  def initialize(levels)
    @levels = levels
  end

  def find_parking_spot(vehicle)
    levels.each do |level|
      available_spot = level.find_available_spot(vehicle)
      return [level, available_spot] if available_spot
    end

    'Sorry, this parking lot is full'
  end
end