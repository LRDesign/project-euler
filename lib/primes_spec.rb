require File.dirname(__FILE__) + '/primes'

describe "primes module" do
  before(:each) do
    class PrimeTest
      include Primes
    end
  end  
end