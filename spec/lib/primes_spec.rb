require File.dirname(__FILE__) + "/../spec_helper.rb"
require 'primes'

describe "primes module" do
  before(:each) do
    @pt = PrimeClass.new
  end  
  
  describe "initialize_array" do
    it "should initialize to [ 2, 3 ] if no options provided" do
      @pt.initialize_array.should == [ 2, 3 ]
    end
  end
  
  describe "primes_array" do
    it "should generate small arrays" do      
      arr = @pt.primes_array(:count => 5)
      arr.should have(5).members       
      arr.should == [ 2, 3, 5, 7, 11]  
    end
  end
  
end