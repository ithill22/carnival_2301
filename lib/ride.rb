class Ride

  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log,
              :number_of_rides

  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
    @number_of_rides = 0
  end

  def board_rider(visitor)
    if visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement)
      visitor.spending_money = visitor.spending_money - @admission_fee
      @total_revenue = @total_revenue + @admission_fee
      @rider_log[visitor] += 1
      @number_of_rides += 1
    end
  end
end
