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



  describe "#learn_terrain!(terrain)" do 
    xit " can add a new terrain to the list of acceptable terrains" do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#log_ride(ride, time)" do 
    xit " can document a trail that what biked and the bikers time" do 
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expected = ({
                  @ride1 => [92.5, 91.1],
                  @ride2 => [60.9, 61.6]
          })

      expect(@biker.rides).to eq(expected)
    end
  end

  describe "#personal_record(ride)" do
    xit " can find the personal record for each biker for each logged trail" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)

      @biker2.log_ride(@ride1, 97.0)
      @biker2.log_ride(@ride1, 67.0)

      expect(@biker2.rides).to eq({})

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)

      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)

      expected = ({
                  @ride2 => [65]
          })

      expect(@biker2.rides).to eq({@ride2 => [65]})

      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to be(false)
    end
  end

end