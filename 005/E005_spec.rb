
require File.dirname(__FILE__) + "/../spec/spec_helper.rb"
require File.dirname(__FILE__) + "/E005"

describe 'E005' do
  before :each do
    @sol = E005.new
  end
  
  describe "min_prime_factors" do
    it "should correctly describe 6" do
      @sol.min_prime_factors(6).should == { 2 => 2, 3 => 1, 5 => 1 }
    end
    it "should correctly describe 7" do
      @sol.min_prime_factors(7).should == { 2 => 2, 3 => 1, 5 => 1, 7 => 1 }
    end
    it "should correctly describe 8" do
      @sol.min_prime_factors(8).should == { 2 => 3, 3 => 1, 5 => 1, 7 => 1 }
    end
    
  end

end