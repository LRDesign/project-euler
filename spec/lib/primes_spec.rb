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
    it "should generate small arrays with max count" do      
      arr = @pt.primes_array(:count => 5)
      arr.should have(5).members       
      arr.should == [ 2, 3, 5, 7, 11]  
    end
    
    it "should generate small arrays with max member size" do
      arr = @pt.primes_array(:limit => 20)
      arr.should == [ 2, 3, 5, 7, 11, 13, 17, 19 ]
    end
  end
  
  describe "default_array" do
    it "should contain the first 100 primes" do
      @pt.first_primes.should have(100).members
    end    
  end
  
  # describe "prime_factors_hash" do
  #   it "should return the prime factor counts of 3" do
  #     @pt.prime_factors_hash(3).should == { 3 => 1 }
  #   end
  #   
  #   it "should return the prime factor counts of 4" do
  #     @pt.prime_factors_hash(4).should == { 2 => 2 }
  #   end
  #   
  #   it "should return the prime factor counts of 12" do
  #     @pt.prime_factors_hash(6).should == { 2 => 2, 3 => 1 }
  #   end
  # end
  
  describe "first_prime_factor" do
    it "should pull 2 out of 12" do
      @pt.first_prime_factor(12).should == { :factor => 2, :dividend => 6 }
    end
    
    it "should pull 3 out of 15" do
      @pt.first_prime_factor(15).should == { :factor => 3, :dividend => 5 }
    end
    
    it "should pull 13 out of 13" do
      @pt.first_prime_factor(13).should == { :factor => 13, :dividend => 1 }
    end      
  end
  
end