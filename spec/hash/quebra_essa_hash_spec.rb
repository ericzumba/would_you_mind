require 'quebra_essa/hash'

describe QuebraEssa::Hash do
  it "should exist" do
    QuebraEssa::Hash.should eql(QuebraEssa::Hash)
  end

  it "should work" do 
    hash = {}
    hash[:a] = 'pimba'
    QuebraEssa::Hash.reach(hash, :a).should eql('pimba')
  end

  it "should work again" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba'
    QuebraEssa::Hash.reach(hash, :a, :b).should eql('pimba')
  end

  it "should reach the last avaiable key" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba'
    QuebraEssa::Hash.reach(hash, :a, :b, :c).should eql('pimba')
  end

  it "should reach the last avaiable key even if its nil" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = nil
    QuebraEssa::Hash.reach(hash, :a, :b, :c).should eql(nil)
  end

  it "should work yet one more time" do
    hash = {}
    hash[:a] = {}
    hash[:a][:b] = 'pimba' 
    QuebraEssa::Hash.reach(hash, :a).should eql({b: 'pimba'})
  end

  context "binding method on self" do
    
    before :each do
      @hash = {}
      QuebraEssa::Hash.bind(@hash, :reach)
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
