class Level
  attr_reader :spots

  def initialize(spots)
    @spots = spots
  end

  def find_available_spot(vehicle)
    spot = spots.find {|spot| spot.available?(vehicle)}
    spot.claim if spot
    spot
  end
end