require 'quebra_essa/string'

describe WouldYouMind::String do
  it "should exist" do
    WouldYouMind::String.should eql(WouldYouMind::String)
  end

  it "souhd work" do
    str = "uno"
    WouldYouMind::String.csv_to_ary(str).should eql ["uno"]
  end

  it "should work yet one more time" do
    str = "dos"
    WouldYouMind::String.csv_to_ary(str).should eql ["dos"]
  end
  
  it "should play nicely when there are 2 elements" do
    str = "uno, dos"
    WouldYouMind::String.csv_to_ary(str).should eql ["uno", "dos"]
  end

  it "should use a block to format each element" do
    str = "1, 2"
    ary = WouldYouMind::String.csv_to_ary(str) {|e| e.to_i} 
    ary.should eql [1, 2]
  end

  context "binding method on self" do
    it "souhd work" do
      str = "uno"
      WouldYouMind::String.bind(str, :csv_to_ary)
      str.csv_to_ary.should eql ["uno"]
    end

    it "should work yet one more time" do
      str = "dos"
      WouldYouMind::String.bind(str, :csv_to_ary)
      str.csv_to_ary.should eql ["dos"]
    end
    
    it "should play nicely when there are 2 elements" do
      str = "uno, dos"
      WouldYouMind::String.bind(str, :csv_to_ary)
      str.csv_to_ary.should eql ["uno", "dos"]
    end

    it "should use a block to format each element" do
      str = "1, 2"
      WouldYouMind::String.bind(str, :csv_to_ary)
      ary = str.csv_to_ary {|e| e.to_i} 
      ary.should eql [1, 2]
    end
  end
end
