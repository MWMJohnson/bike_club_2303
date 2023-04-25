require "spec_helper"

RSpec.describe BikeClub do
  
  before(:each) do 
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @club1 = BikeClub.new("Denver Beer Co")
  end

  describe "#initialize" do 
    it "exists" do 
      expect(@club1).to be_a(BikeClub)
    end

    it "has readable attributes" do 
      expect(@club1.name).to eq("Denver Beer Co")
      expect(@club1.bikers).to eq([])
    end
  end

  describe "#add_biker(biker)" do 
    it " can add a biker to the bike club" do 
      expect(@club1.bikers).to eq([])
      expect(@club1.add_biker(@biker)).to eq([@biker])
      expect(@club1.bikers).to eq([@biker])
    end
  end

  describe "#most_rides" do 
    it " can identify which biker has the most rides" do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      @biker2.log_ride(@ride2, 67.0)
      

      @club1.add_biker(@biker)
      @club1.add_biker(@biker2)

      expect(@club1.bikers).to eq([@biker, @biker2])
      expect(@club1.most_rides).to eq(@biker)
    end
  end

  describe "#best_times(ride)" do 
    xit " can identify which biker has the fastest time on that ride" do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      @biker2.log_ride(@ride2, 67.0)
      

      @club1.add_biker(@biker)
      @club1.add_biker(@biker2)

      
    end
  end

  describe "#bikers_eligible(ride)" do 
    it " can identify which bikers are eligible for a ride" do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @club1.add_biker(@biker)
      @club1.add_biker(@biker2)

      expect(@club1.bikers_eligible(@ride2)).to eq[@biker]
    end
  end


end

