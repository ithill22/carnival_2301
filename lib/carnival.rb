class Carnival

  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular
    rides.max_by {|ride| ride.number_of_rides}
  end
  
end
