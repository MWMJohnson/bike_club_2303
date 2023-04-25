class Ride
  attr_reader :name,
              :distance,
              :terrain

  def initialize(info)
    @name = info[:name]
    @distance = info[:distance]
    @loop = info[:loop]
    @terrain = info[:terrain]
  end

  def loop?
    @loop
  end

  def total_distance
    if @loop == false
      total_distance = @distance * 2
    else
      total_distance = @distance
    end
    total_distance
  end

end