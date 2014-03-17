require 'would_you_mind/hash'

describe WouldYouMind::Hash do
  it "should exist" do
    WouldYouMind::Hash.should eql(WouldYouMind::Hash)
  end

  it "should work" do 
    hash = {}
    hash[:a] = 'pimba'
    WouldYouMind::Hash.reach(hash, :a).should eql('pimba')
  end

  it "should work again" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba'
    WouldYouMind::Hash.reach(hash, :a, :b).should eql('pimba')
  end

  it "should reach the last avaiable key" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba'
    WouldYouMind::Hash.reach(hash, :a, :b, :c).should eql('pimba')
  end

  it "should reach the last avaiable key even if its nil" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = nil
    WouldYouMind::Hash.reach(hash, :a, :b, :c).should eql(nil)
  end

  it "should work yet one more time" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba' 
    WouldYouMind::Hash.reach(hash, :a).should eql({b: 'pimba'})
  end

  context "binding method on self" do
    
    before :each do
      @hash = {}
      WouldYouMind::Hash.bind(@hash, :reach)
    end

    it "should work" do
      @hash[:a] = 'pimba'
      @hash.reach(:a).should eql('pimba')
    end 

    it "should work again" do
      @hash[:a] = {}
      @hash[:a][:b] = 'pimba'
      @hash.reach(:a, :b).should eql('pimba')
    end

    it "should reach the last avaiable key" do
      @hash[:a] = {}
      @hash[:a][:b] = 'pimba'
      @hash.reach(:a, :b, :c).should eql('pimba')
    end

    it "should reach the last avaiable key even if its nil" do
      @hash[:a] = {}
      @hash[:a][:b] = nil
      @hash.reach(:a, :b, :c).should eql(nil)
    end

    it "should work yet one more time" do
      @hash[:a] = {}
      @hash[:a][:b] = 'pimba' 
      @hash.reach(:a).should eql({b: 'pimba'})
    end

  end
end
