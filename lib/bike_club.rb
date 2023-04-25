class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    most_rides_hash = {}
  
    @bikers.each do |biker|
      most_rides_hash[biker] = {}
      biker.rides.each do |ride, times|
        most_rides_hash[biker][ride] = times.length
      end
    end

    max_biker = nil
    max_rides = 0

    most_rides_hash.each do |biker, rides|
      total_rides = rides.values.reduce(:+)
      if total_rides > max_rides
        max_biker = biker
        max_rides = total_rides
      end
    end
    max_biker
  end

  def best_time(ride)
    
  end

  def bikers_eligible(ride)
    eligible_bikers = []
    @bikers.each do |biker|
      if biker.acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance.to_f
        eligible_bikers << biker
      end
    end
  end
  
end