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
end
