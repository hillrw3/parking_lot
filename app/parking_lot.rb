class ParkingLot
  attr_reader :spots

  def initialize(spots)
    @spots = spots.sort_by(&:level)
  end

  def find_parking_spot(vehicle)
    spots.each do |spot|
      if spot.available?(vehicle)
        spot.claim
        return spot
      end
    end

    'Sorry, this parking lot is full'
  end
end