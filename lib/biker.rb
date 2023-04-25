class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @rides.key?(ride)
      @rides[ride] << time
    else
      if @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
        @rides[ride] = [time]
      else
        false
      end
    end
    @rides
  end

  def personal_record(ride)
    return false if !@rides.key?(ride)
    personal_best = {}
    @rides.map do |ride, times|
      personal_best[ride] = times.min
    end
    personal_best[ride]
  end
  
end