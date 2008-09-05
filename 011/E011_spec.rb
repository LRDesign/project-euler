require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E011"

describe "E011" do
  before(:each) do
    @es = E011.new
  end
  describe "grid_array" do
    it "should have 400" do
      @es.grid_array.should have(400).members
    end
    
    it "should start with 8" do
      @es.grid_array[0].should == 8
    end
  end
  
  describe "product" do
    it "horizontal from 0 should be 34144" do
      @es.product(E011::DIRECTIONS[0],@es.grid_array,0).should == 34144
    end
    
    # >> 49 * 70 * 31 * 47
    #     => 4997510
    it "vertical from 41 should be 4997510" do
      @es.product(E011::DIRECTIONS[1],@es.grid_array,41).should == 4997510
    end    
    
    # >> 49 * 49 * 95 * 71
    # => 16194745
    it "diagonal from 20 should be 16194745" do
      @es.product(E011::DIRECTIONS[2],@es.grid_array,20).should == 16194745
    end
    
    # it "vertical from 380 should be 0" do
    #    @es.product(E011::DIRECTIONS[1],@es.grid_array,380).should == 0
    #  end
    #  
    #  it "horizontal from 19 should be 0" do 
    #    @es.product(E011::DIRECTIONS[0],@es.grid_array,19).should == 0
    #  end
  end
  
end