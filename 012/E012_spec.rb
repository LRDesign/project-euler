require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E012"

describe "E012" do
  before(:each) do
    @es = E012.new
  end
  
  describe "triangle function" do
    it "should generate the first 7 triangle numbers" do
      (1..7).to_a.collect { |n| @es.triangle(n) }.should == [1, 3, 6, 10, 15, 21, 28]
    end
  end
end