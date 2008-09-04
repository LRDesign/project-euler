
require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E009"

describe "E009" do
  before(:each) do
    @es = E009.new
  end
  describe "is_pythagorean_triple?" do
    it "should return true for 3, 4, 5" do
      @es.is_pythagorean_triple?(3, 4, 5).should == true
    end
    it "should return true for 8, 6, 10" do
      @es.is_pythagorean_triple?(8, 6, 10).should == true
    end
    it "should return true for 8, 6, 11" do
      @es.is_pythagorean_triple?(8, 6, 11).should == false
    end
    
  end
end