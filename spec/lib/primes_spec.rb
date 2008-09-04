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
  
  describe "prime_factors_hash" do
    it "should return the prime factor counts of 3" do
       @pt.prime_factors_hash(3).should == { 3 => 1 }
     end
     
     it "should return the prime factor counts of 4" do
       @pt.prime_factors_hash(4).should == { 2 => 2 }
     end
    
    it "should return the prime factor counts of 12" do
      @pt.prime_factors_hash(12).should == { 2 => 2, 3 => 1 }
    end
  end
  
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
  
  describe "prime_factors" do
    it "should contain all prime factors of 24" do
      @pt.prime_factors(12).should == [ 2, 2, 3 ]
    end
  
    it "should contain all prime factors of 42" do
      @pt.prime_factors(42).should == [ 2, 3, 7 ]
    end    
  end
  
  describe "primes_array_sieved" do
    it "should produce the same results as the existng primes_array method" do
      @pt.primes_array_sieved(:limit => 20).should == @pt.primes_array(:limit => 20)
    end
    
    it "should be inclusive if limit is a prime" do
      @pt.primes_array_sieved(:limit => 5).should == [2, 3, 5]
    end    
  end
  
  describe "sieve" do
    it "should do a plain sieve for no supplied primes and no offset" do
      arr = Array.new(10,true)
      @pt.sieve(arr,[],0).should == [2, 3, 5, 7]
    end
    
    it "should succeed for an offset when supplied with lower primes" do
      pending
      arr = Array.new(10,true)
      @pt.sieve(arr,[2, 3, 5, 7],10).should == [2, 3, 5, 7, 11, 13, 17, 19]    
    end
  end
  
  describe "sieve_existing" do
    it "should mark multples of the array values fals" do
      arr = Array.new(16, true)
      @pt.sieve_existing(arr,[2, 3, 5],0).should == [ 
        true, # 0 
        true, # 1 
        true, # 2 
        true, # 3 
        true, # 4 
        true, # 5 
        true, # 6  - ignores evens
        true, # 7 
        true, # 8 
        false, # 9          
        true, # 10 - ignores evens
        true, # 11
        true, # 12 - ignores evens
        true, # 13
        true, # 14
        false] # 15
    end
  end
  
end