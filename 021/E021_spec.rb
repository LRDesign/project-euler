require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E021"

describe "E021" do
  before(:each) do
    @es = E021.new
  end
  describe "sum_of_divisors" do
    it "should give 284 for 220" do
      @es.sum_of_divisors(220).should == 284  
    end
    
    it "should give 220 for 284" do
      @es.sum_of_divisors(284).should == 220      
    end
  end

end