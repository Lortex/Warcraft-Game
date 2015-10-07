require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "has 500 health I hope" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "the barracks should take half the attack damage" do
    @barracks.damage(10)
    expect(@barracks.health_points).to eq(495)
    end
  end

  describe "#alive?" do
    it "unit is dedded if health is 0 and cannot perform additional actions" do
    expect(@barracks).to receive(:health_points).and_return(0)
    expect(@barracks.alive?).to be_falsey 
    end
  end

  describe "#alive?" do
    it "unit alive is true if health is above 0" do
    expect(@barracks).to receive(:health_points).and_return(5)
    expect(@barracks.alive?).to be_truthy
    end
  end
 

#we could use "middleware", extra method or code such as can_attack? to check for
#whether or not something will go through
# 
  describe "#attack!" do
    it "unit that is dead cannot receieve damage and health stays at 0" do
    footman = Footman.new
    badguy = Footman.new(0, 15)
    #bad code. will not work
    #expect(badguy).to receive(:health_points).with(0)
    footman.attack!(badguy)
    expect(badguy.health_points).to eq(0)
    end
  end

  describe "damage" do
    it "vice versa, an alive unit can not take damage from a dead unit" do
    footman = Footman.new
    badguy = Footman.new(0, 15)
    badguy.attack!(footman)
    expect(footman.health_points).to eq(60)
    end
  end

  describe "#lumber" do
    it "barracks should have some stiff wood" do
      expect(@barracks.lumber).to eq(500)
    end
  end

#and finally, testing the freaky deaky siege engine
  describe "#siege_engine" do
    it "siege_engine should do 2x its attack power, 50, to barracks" do
      ram = SiegeEngine.new
      ram.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end
    it "siege_engine should be able to attack other siege engines" do
      ram = SiegeEngine.new
      badram = SiegeEngine.new
      ram.attack!(badram)
      expect(badram.health_points).to eq(350)
    end
  end

  describe "#can_train_siege?" do
    it "returns true if there are enough resources to train a friggin siege engine" do
      expect(@barracks.can_train_siege?).to be_truthy
    end
    
    it "returns false if there isn't enough food to train a siege" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it "returns false if there is no gold" do
      expect(@barracks).to receive(:gold).and_return(1)
      expect(@barracks.can_train_siege?).to be_falsey
    end

    it "returns false if there is no lumber" do
      expect(@barracks).to receive(:gold).and_return(1)
      expect(@barracks.can_train_siege?).to be_falsey
    end
  end

  describe "#train_siege" do
    it "costs 200gold to train" do
      @barracks.train_siege
      expect(@barracks.gold).to eq(800)
    end

    it "costs 3 food" do
      @barracks.train_siege
      expect(@barracks.food).to eq(77)
    end

    it "costs 60 lumber" do
      @barracks.train_siege
      expect(@barracks.lumber).to eq(440)
    end

    it "produces a siege unit" do
      ram = @barracks.train_siege
      expect(ram).to be_an_instance_of(SiegeEngine)
    end
  end
end
