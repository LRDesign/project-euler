require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E014"

describe "E014" do
  before(:each) do
    @es = E014.new
  end
  
  describe "step" do
    it "should return 5 when given 10" do
     @es.step(10).should == 5 
    end
    
    it "should return 166 when given 55" do
      @es.step(55).should == 166
    end
  end
  
  describe "chain_length" do
    it "should return 7 when given 10" do
      @es.chain_length(10).should == 7
    end
    
    it "should return 10 when given 13" do
      @es.chain_length(13).should == 10      
    end
    
    it "should return 114 when given 110" do
      @es.chain_length(110).should == 114
    end
  end
  
end

  
  